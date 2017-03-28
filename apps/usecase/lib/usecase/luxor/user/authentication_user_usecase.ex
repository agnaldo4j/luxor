defmodule Usecase.Luxor.AuthenticationUserUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.AuthenticationUserUsecase, state, opts)
    end

    def handle_call({:authentication_user, command = %Command.User.AuthenticationNewUserCommand{}}, _from, actual_state) do
        saved_user_model = execute(command)
        {:reply, saved_user_model, actual_state}
    end

    defp execute(command = %Command.User.AuthenticationNewUserCommand{}) do
        Persistence.Luxor.UserPersistenceAdapterApi.findByEmailAndPassword(command.email, command.password)
    end
end