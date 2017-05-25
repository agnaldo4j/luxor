defmodule Usecase.Luxor.SaveTruckUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveTruckUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Truck.SaveTruckCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Truck.SaveTruckCommand{}) do
        %Luxor.Truck{name: command.name} |>
        Luxor.Truck.identify |>
        Persistence.Luxor.TruckPersistenceAdapterApi.save
    end
end