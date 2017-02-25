defmodule Usecase.Kaizen.GetUserRootInfoUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Kaizen.GetUserRootInfoUsecase, state, opts)
    end

    def handle_call({:get_user_root_info, command = %Command.User.GetUserRootInfoCommand{}}, _from, actual_state) do
        user_repositories = get_user_root_info(command)
        {:reply, user_repositories, actual_state}
    end

    defp get_user_root_info(command = %Command.User.GetUserRootInfoCommand{}) do
        repositories = get_user_repositories(command)
        organizations = get_user_organizations(command)
        %{:repositories => repositories, :organizations => organizations}
        # |> Persistence.Kaizen.UserPersistenceAdapterApi.save
    end

    defp get_user_repositories(command = %Command.User.GetUserRootInfoCommand{}) do
        %Command.Github.GetUserRepositoriesCommand{token: command.github_token} |>
        Github.Kaizen.GithubAdapterApi.get_user_repositories
    end

    defp get_user_organizations(command = %Command.User.GetUserRootInfoCommand{}) do
        %Command.Github.GetUserOrganizationsCommand{token: command.github_token} |>
        Github.Kaizen.GithubAdapterApi.get_user_organizations
    end
end