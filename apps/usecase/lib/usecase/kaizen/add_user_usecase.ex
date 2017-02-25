defmodule Usecase.Kaizen.AddUserUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Kaizen.AddUserUsecase, state, opts)
    end

    def handle_call({:add_new_user, command = %Command.User.AddNewUserCommand{}}, _from, actual_state) do
        saved_user_model = add_new_user(command)
        {:reply, saved_user_model, actual_state}
    end

    defp add_new_user(command = %Command.User.AddNewUserCommand{}) do
        %Command.Github.GetUserInfoCommand{token: command.github_token} |>
        Github.Kaizen.GithubAdapterApi.get_user_info
        # |> Persistence.Kaizen.UserPersistenceAdapterApi.save
    end
end