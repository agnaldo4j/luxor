defmodule Usecase.Luxor.GetAnalysisUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetAnalysisUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Analysis.GetAnalysisCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Analysis.GetAnalysisCommand{}) do
        %Luxor.Analysis{id: command.id} |>
        Persistence.Luxor.AnalysisPersistenceAdapterApi.get
    end
end
