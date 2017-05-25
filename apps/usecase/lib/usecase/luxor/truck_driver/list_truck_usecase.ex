defmodule Usecase.Luxor.ListTruckUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListTruckUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Truck.ListTruckCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.Truck.ListTruckCommand{}) do
        Persistence.Luxor.TruckPersistenceAdapterApi.list
    end
end
