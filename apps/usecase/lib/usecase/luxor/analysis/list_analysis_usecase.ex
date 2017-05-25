defmodule Usecase.Luxor.ListAnalysisUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListAnalysisUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Analysis.ListAnalysisCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.Analysis.ListAnalysisCommand{}) do
        Persistence.Luxor.AnalysisPersistenceAdapterApi.list
    end
end