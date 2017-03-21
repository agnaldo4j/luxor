defmodule Usecase.Luxor.UpdateAnalysisUsecase do
    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateAnalysisUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Analysis.UpdateAnalysisCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Analysis.UpdateAnalysisCommand{}) do
        %Luxor.Analysis{
            id: command.id,
            name: command.name
        } |>
        Persistence.Luxor.AnalysisPersistenceAdapterApi.update
    end
end