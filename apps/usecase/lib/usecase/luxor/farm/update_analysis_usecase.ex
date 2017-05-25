defmodule Usecase.Luxor.UpdateFarmUsecase do
    @moduledoc ""

    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateFarmUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Farm.UpdateFarmCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Farm.UpdateFarmCommand{}) do
        %Luxor.Farm{
            id: command.id,
            name: command.name
        } |>
        Persistence.Luxor.FarmPersistenceAdapterApi.update
    end
end
