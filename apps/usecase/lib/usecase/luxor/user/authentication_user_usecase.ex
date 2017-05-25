defmodule Usecase.Luxor.AuthenticationUserUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.AuthenticationUserUsecase, state, opts)
    end

    def handle_call({:authenticate, command = %Command.User.AuthenticationUserCommand{}}, _from, actual_state) do
        saved_user_model = execute(command)
        {:reply, saved_user_model, actual_state}
    end

    defp execute(command = %Command.User.AuthenticationUserCommand{}) do
        %Luxor.User{email: command.email, password: command.password} |>
        Persistence.Luxor.UserPersistenceAdapterApi.find_by_email_and_password
    end
end
