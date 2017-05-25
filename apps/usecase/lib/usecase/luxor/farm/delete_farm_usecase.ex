defmodule Usecase.Luxor.DeleteFarmUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteFarmUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Farm.DeleteFarmCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Farm.DeleteFarmCommand{}) do
        %Luxor.Farm{id: command.id} |>
        Persistence.Luxor.FarmPersistenceAdapterApi.delete
    end
end
