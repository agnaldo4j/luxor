defmodule Usecase.Luxor.DeleteTruckDriverUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteTruckDriverUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.TruckDriver.DeleteTruckDriverCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.TruckDriver.DeleteTruckDriverCommand{}) do
        %Luxor.TruckDriver{id: command.id} |>
        Persistence.Luxor.TruckDriverPersistenceAdapterApi.delete
    end
end