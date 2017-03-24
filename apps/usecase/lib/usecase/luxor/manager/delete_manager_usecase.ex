defmodule Usecase.Luxor.DeleteManagerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteManagerUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Manager.DeleteManagerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Manager.DeleteManagerCommand{}) do
        %Luxor.Manager{id: command.id} |>
        Persistence.Luxor.ManagerPersistenceAdapterApi.delete
    end
end