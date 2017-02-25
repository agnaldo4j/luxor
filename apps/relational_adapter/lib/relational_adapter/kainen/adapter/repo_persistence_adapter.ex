defmodule RelationalAdapter.Kaizen.RepoPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Kaizen.RepoPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_repos, _from, actual_state) do
        result = RelationalAdapter.Kaizen.RepoRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain)
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_repo_by_id, repo_id}, _from, actual_state) do
        {:reply, %Kaizen.Repo{id: repo_id}, actual_state}
    end

    def handle_call({:save_repo, repo}, _from, actual_state) do
        repo |>
        RelationalAdapter.Kaizen.Repo.from_business |>
        RelationalAdapter.Kaizen.RepoRepository.save |>
        RelationalAdapter.Kaizen.Repo.to_business |>
        save_repo_response(actual_state)
    end

    defp save_repo_response(repo, actual_state) do
        {:reply, repo, actual_state}
    end

    defp list_to_domain() do
        fn(resultAdopt) ->
            %Kaizen.Repo{
                id: resultAdopt.id,
                created: resultAdopt.created,
                updated: resultAdopt.updated
            }
        end
    end
end
