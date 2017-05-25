defmodule Usecase.Luxor.GetFarmUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetFarmUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Farm.GetFarmCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Farm.GetFarmCommand{}) do
        %Luxor.Farm{id: command.id} |>
        Persistence.Luxor.FarmPersistenceAdapterApi.get
    end
end
