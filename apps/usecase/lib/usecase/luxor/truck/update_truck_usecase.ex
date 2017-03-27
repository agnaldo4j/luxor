defmodule Usecase.Luxor.UpdateTruckUsecase do
    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateTruckUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Truck.UpdateTruckCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Truck.UpdateTruckCommand{}) do
        %Luxor.Truck{
            id: command.id,
            name: command.name
        } |>
        Persistence.Luxor.TruckPersistenceAdapterApi.update
    end
end