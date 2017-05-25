defmodule Usecase.Luxor.GetTruckUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetTruckUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Truck.GetTruckCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Truck.GetTruckCommand{}) do
        %Luxor.Truck{id: command.id} |>
        Persistence.Luxor.TruckPersistenceAdapterApi.get
    end
end