defmodule Usecase.Luxor.AnalysisUsecaseApi do
    @moduledoc ""

    def save(command = %Command.Analysis.SaveAnalysisCommand{}) do
        GenServer.call(:save_analysis_usecase, {:save, command}, 15_000)
    end

    def delete(command = %Command.Analysis.DeleteAnalysisCommand{}) do
        GenServer.call(:delete_analysis_usecase, {:delete, command}, 15_000)
    end

    def update(command = %Command.Analysis.UpdateAnalysisCommand{}) do
        GenServer.call(:update_analysis_usecase, {:update, command}, 15_000)
    end

    def list(command = %Command.Analysis.ListAnalysisCommand{}) do
        GenServer.call(:list_analysis_usecase, {:list, command}, 15_000)
    end

    def get(command = %Command.Analysis.GetAnalysisCommand{}) do
        GenServer.call(:get_analysis_usecase, {:get, command}, 15_000)
    end
end
