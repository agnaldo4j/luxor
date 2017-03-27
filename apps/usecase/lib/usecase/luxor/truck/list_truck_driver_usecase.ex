defmodule Usecase.Luxor.ListTruckDriverUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListTruckDriverUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.TruckDriver.ListTruckDriverCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.TruckDriver.ListTruckDriverCommand{}) do
        Persistence.Luxor.TruckDriverPersistenceAdapterApi.list
    end
end