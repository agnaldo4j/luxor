defmodule Usecase.Luxor.ListFarmUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListFarmUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Farm.ListFarmCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.Farm.ListFarmCommand{}) do
        Persistence.Luxor.FarmPersistenceAdapterApi.list
    end
end