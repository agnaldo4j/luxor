defmodule Usecase.Luxor.DeleteAnalysisUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteAnalysisUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Analysis.DeleteAnalysisCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Analysis.DeleteAnalysisCommand{}) do
        %Luxor.Analysis{id: command.id} |>
        Persistence.Luxor.AnalysisPersistenceAdapterApi.delete
    end
end