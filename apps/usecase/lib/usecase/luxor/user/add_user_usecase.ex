defmodule Usecase.Luxor.AddUserUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.AddUserUsecase, state, opts)
    end

    def handle_call({:add_new_user, command = %Command.User.AddNewUserCommand{}}, _from, actual_state) do
        saved_user_model = add_new_user(command)
        {:reply, saved_user_model, actual_state}
    end

    defp add_new_user(command = %Command.User.AddNewUserCommand{}) do
        %Luxor.User{name: command.name, email: command.email, password: command.password} |>
        Luxor.User.identify |>
        Persistence.Luxor.UserPersistenceAdapterApi.save
    end
end