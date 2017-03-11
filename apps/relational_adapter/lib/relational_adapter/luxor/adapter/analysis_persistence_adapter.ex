defmodule RelationalAdapter.Luxor.AnalysisPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.AnalysisPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_analyzes, _from, actual_state) do
        result = RelationalAdapter.Luxor.AnalysisRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_analysis_by_id, analysis_id}, _from, actual_state) do
        {:reply, %Luxor.Analysis{id: analysis_id}, actual_state}
    end

    def handle_call({:save_analysis, analysis}, _from, actual_state) do
        analysis |>
        RelationalAdapter.Luxor.Analysis.from_business |>
        RelationalAdapter.Luxor.AnalysisRepository.save |>
        RelationalAdapter.Luxor.Analysis.to_business |>
        save_analysis_response(actual_state)
    end

    defp save_analysis_response(analysis, actual_state) do
        {:reply, analysis, actual_state}
    end

    defp list_to_domain() do
        fn(analysis) -> RelationalAdapter.Luxor.Analysis.to_business(analysis) end
    end
end
