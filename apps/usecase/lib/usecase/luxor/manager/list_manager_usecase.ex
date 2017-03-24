defmodule Usecase.Luxor.ListManagerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListManagerUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Manager.ListManagerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Manager.ListManagerCommand{}) do
        Persistence.Luxor.ManagerPersistenceAdapterApi.list
    end
end