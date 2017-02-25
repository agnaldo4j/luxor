defmodule Usecase.Kaizen.GetUserRepositoriesUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Kaizen.GetUserRepositoriesUsecase, state, opts)
    end

    def handle_call({:repositories, command = %Command.User.GetUserRepositoriesCommand{}}, _from, actual_state) do
        user_repositories = get_user_repositories(command)
        {:reply, user_repositories, actual_state}
    end

    defp get_user_repositories(command = %Command.User.GetUserRepositoriesCommand{}) do
        %Command.Github.GetUserRepositoriesCommand{token: command.github_token} |>
        Github.Kaizen.GithubAdapterApi.get_user_repositories
        # |> Persistence.Kaizen.UserPersistenceAdapterApi.save
    end
end