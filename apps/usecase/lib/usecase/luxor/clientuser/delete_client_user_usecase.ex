defmodule Usecase.Luxor.DeleteClientUserUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteClientUserUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.ClientUser.DeleteClientUserCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.ClientUser.DeleteClientUserCommand{}) do
        %Luxor.ClientUser{id: command.id} |>
        Persistence.Luxor.ClientUserPersistenceAdapterApi.delete
    end
end
