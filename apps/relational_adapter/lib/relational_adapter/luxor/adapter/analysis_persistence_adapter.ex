defmodule RelationalAdapter.Luxor.AnalysisPersistenceAdapter do
    @moduledoc ""

    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.AnalysisPersistenceAdapter, state, opts)
    end

    def handle_call({:save, analysis}, _from, actual_state) do
        analysis |>
        RelationalAdapter.Luxor.Analysis.from_business |>
        RelationalAdapter.Luxor.AnalysisRepository.save |>
        RelationalAdapter.Luxor.Analysis.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, analysis}, _from, actual_state) do
        analysis.id |>
        RelationalAdapter.Luxor.AnalysisRepository.get |>
        RelationalAdapter.Luxor.AnalysisRepository.delete |>
        RelationalAdapter.Luxor.Analysis.to_business |>
        response(actual_state)
    end

    def handle_call({:update, analysis}, _from, actual_state) do
        analysis.id |>
        RelationalAdapter.Luxor.AnalysisRepository.get |>
        RelationalAdapter.Luxor.Analysis.change_state_to(analysis) |>
        RelationalAdapter.Luxor.AnalysisRepository.update |>
        RelationalAdapter.Luxor.Analysis.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.AnalysisRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, analysis}, _from, actual_state) do
        analysis.id |>
        RelationalAdapter.Luxor.AnalysisRepository.get |>
        RelationalAdapter.Luxor.Analysis.to_business |>
        response(actual_state)
    end

    defp response(analysis, actual_state) do
        {:reply, analysis, actual_state}
    end

    defp list_to_domain() do
        fn(analysis) -> RelationalAdapter.Luxor.Analysis.to_business(analysis) end
    end
end
