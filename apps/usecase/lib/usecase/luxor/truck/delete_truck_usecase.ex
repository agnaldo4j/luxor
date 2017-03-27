defmodule Usecase.Luxor.DeleteTruckUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteTruckUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Truck.DeleteTruckCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Truck.DeleteTruckCommand{}) do
        %Luxor.Truck{id: command.id} |>
        Persistence.Luxor.TruckPersistenceAdapterApi.delete
    end
end