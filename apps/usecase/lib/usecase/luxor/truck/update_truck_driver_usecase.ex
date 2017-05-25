defmodule Usecase.Luxor.UpdateTruckDriverUsecase do
    @moduledoc ""

    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateTruckDriverUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.TruckDriver.UpdateTruckDriverCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.TruckDriver.UpdateTruckDriverCommand{}) do
        %Luxor.TruckDriver{
            id: command.id,
            name: command.name
        } |>
        Persistence.Luxor.TruckDriverPersistenceAdapterApi.update
    end
end
