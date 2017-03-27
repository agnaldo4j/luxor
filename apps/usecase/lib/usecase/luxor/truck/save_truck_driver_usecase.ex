defmodule Usecase.Luxor.SaveTruckDriverUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveTruckDriverUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.TruckDriver.SaveTruckDriverCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.TruckDriver.SaveTruckDriverCommand{}) do
        %Luxor.TruckDriver{name: command.name} |>
        Luxor.TruckDriver.identify |>
        Persistence.Luxor.TruckDriverPersistenceAdapterApi.save
    end
end