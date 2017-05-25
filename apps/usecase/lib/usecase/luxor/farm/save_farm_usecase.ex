defmodule Usecase.Luxor.SaveFarmUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveFarmUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Farm.SaveFarmCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Farm.SaveFarmCommand{}) do
        %Luxor.Farm{name: command.name} |>
        Luxor.Farm.identify |>
        Persistence.Luxor.FarmPersistenceAdapterApi.save
    end
end