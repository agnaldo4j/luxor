defmodule Usecase.Luxor.SaveAnalysisUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveAnalysisUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Analysis.SaveAnalysisCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Analysis.SaveAnalysisCommand{}) do
        %Luxor.Analysis{name: command.name} |>
        Luxor.Analysis.identify |>
        Persistence.Luxor.AnalysisPersistenceAdapterApi.save
    end
end