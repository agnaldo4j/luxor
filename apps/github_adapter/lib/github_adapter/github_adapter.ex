defmodule Kaizen.GithubAdapter do
    use GenServer

    def start_link(state, opts \\ []) do
      GenServer.start_link(Kaizen.GithubAdapter, state, opts)
    end

    def handle_call({:user_info, token}, _from, _actual_state) do
      github_user = execute_github_command(github_user_endpoint(), token)
      build_response user_to_domain(github_user, token)
    end

    def handle_call({:repositories, token}, _from, _actual_state) do
      github_repositories = execute_github_command(github_repositories_endpoint(), token)
      build_response Enum.map(github_repositories, repository_list_domain)
    end

    def handle_call({:organizations, token}, _from, _actual_state) do
      github_organizations =  execute_github_command(github_organizations_endpoint(), token)
      build_response Enum.map(github_organizations, organization_list_domain)
    end

    def handle_call({:repositories_from_owner, owner, token}, _from, _actual_state) do
      github_repositories = execute_github_command(github_repositories_from_owner_endpoint(owner), token)
      build_response Enum.map(github_repositories, repository_list_domain)
    end

    def handle_call({:repositories_from_org, org, token}, _from, _actual_state) do
      github_repositories = execute_github_command(github_repositories_from_org_endpoint(org), token)
      build_response Enum.map(github_repositories, repository_list_domain)
    end

    def handle_call({:projects_from_org, org, token}, _from, _actual_state) do
      github_projects = execute_github_command(github_projects_from_org_endpoint(org), token)
      build_response Enum.map(github_projects, project_list_domain)
    end

    def handle_call({:projects_from_owner_and_repo, owner, repo, token}, _from, _actual_state) do
      github_projects = execute_github_command(github_projects_from_owner_and_repo_endpoint(owner, repo), token)
      build_response Enum.map(github_projects, project_list_domain)
    end

    def handle_call({:columns_from_project, projectId, token}, _from, _actual_state) do
      github_columns = execute_github_command(github_columns_from_project_endpoint(projectId), token)
      build_response Enum.map(github_columns, column_list_domain)
    end

    def handle_call({:cards_from_column, columnsId, token}, _from, _actual_state) do
      github_cards = execute_github_command(github_cards_from_column_endpoint(columnsId), token)
      build_response Enum.map(github_cards, card_list_domain)
    end

    def handle_call({:issue_from_owner_and_repo, owner, repo, token}, _from, _actual_state) do
      github_issues = execute_github_command(github_issues_from_owner_and_repo_endpoint(owner, repo), token)
      build_response Enum.map(github_issues, issue_list_domain)
    end

    defp user_to_domain(github_user, token) do
        %Kaizen.User { user_id: github_user["id"], name: github_user["name"], email: github_user["email"], github_token: token} |>
        Kaizen.User.identify
    end

    defp repository_list_domain() do
        fn(repository) ->
            %Kaizen.Repo{repository_id: repository["id"], name: repository["name"], full_name: repository["full_name"]} |>
            Kaizen.Repo.identify
        end
    end

    defp organization_list_domain() do
        fn(organization) ->
            %Kaizen.Organization{organization_id: organization["id"], name: organization["login"]} |>
            Kaizen.Organization.identify
        end
    end

    defp project_list_domain() do
        fn(project) ->
            %Kaizen.Project{project_id: project["id"], name: project["name"]}
        end
    end

    defp column_list_domain() do
        fn(column) ->
            %Kaizen.Column{column_id: column["id"], name: column["name"]}
        end
    end

    defp card_list_domain() do
        fn(card) ->
            %Kaizen.Card{card_id: card["id"], title: card["note"], issue: card["content_url"]}
        end
    end

    defp issue_list_domain() do
        fn(issue) ->
            %Kaizen.Issue{issue_id: issue["id"], number: issue["number"], title: issue["title"], text: issue["body"], state: issue["state"]}
        end
    end

    defp execute_github_command(endpoint, token) do
      endpoint++'?access_token='++token |>
      send_by_get |>
      parse_response
    end

    defp build_response(result) do
      {:reply, result, []}
    end

    defp github_user_endpoint() do
      github_api_url() ++ '/user'
    end

    defp github_repositories_endpoint() do
      github_api_url() ++ '/user/repos'
    end

    defp github_organizations_endpoint() do
      github_api_url() ++ '/user/orgs'
    end

    defp github_repositories_from_owner_endpoint(owner) do
      github_api_url() ++ '/users/'++ owner ++ '/repos'
    end

    defp github_repositories_from_org_endpoint(org) do
      github_api_url() ++ '/orgs/' ++ org ++ '/repos'
    end

    defp github_projects_from_org_endpoint(org) do
      github_api_url() ++ '/orgs/' ++ org ++ '/projects'
    end

    defp github_projects_from_owner_and_repo_endpoint(owner, repo) do
      github_api_url() ++ '/repos/' ++ owner ++ '/' ++ repo ++ '/projects'
    end

    defp github_columns_from_project_endpoint(projectId) do
      github_api_url() ++ '/projects/' ++ projectId ++ '/columns'
    end

    defp github_cards_from_column_endpoint(columnId) do
      github_api_url() ++ '/projects/columns/' ++ columnId ++ '/cards'
    end

    defp github_issues_from_owner_and_repo_endpoint(owner, repo) do
      github_api_url() ++ '/repos/' ++owner ++ '/' ++ repo ++ '/issues'
    end

    defp parse_response({:ok, {{_, status_code, _}, _, body}}) do
      case status_code do
        200 -> Poison.Parser.parse!(body)
        _   -> %{error: "erro"}
      end
    end

    defp send_by_get(url) do
      header = [{'User-Agent', 'erlang-teste'}, {'Accept', 'application/vnd.github.inertia-preview+json'}]
      :httpc.request(:get, {url, header}, [], [])
    end

    defp github_api_url() do
      'https://api.github.com'
    end
end
