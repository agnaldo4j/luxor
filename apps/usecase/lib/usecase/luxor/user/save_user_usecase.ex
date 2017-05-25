defmodule Usecase.Luxor.SaveUserUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveUserUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.User.SaveUserCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.User.SaveUserCommand{}) do
        %Luxor.User{email: command.email, password: command.password, active: command.active} |>
        Luxor.User.identify |>
        Persistence.Luxor.UserPersistenceAdapterApi.save
    end
end