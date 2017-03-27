defmodule Usecase.Luxor.GetTruckDriverUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetTruckDriverUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.TruckDriver.GetTruckDriverCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.TruckDriver.GetTruckDriverCommand{}) do
        %Luxor.TruckDriver{id: command.id} |>
        Persistence.Luxor.TruckDriverPersistenceAdapterApi.get
    end
end