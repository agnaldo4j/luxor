defmodule Usecase.AnalysisTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveAnalysisUsecase
  doctest Usecase.Luxor.UpdateAnalysisUsecase
  doctest Usecase.Luxor.DeleteAnalysisUsecase
  doctest Usecase.Luxor.ListAnalysisUsecase
  doctest Usecase.Luxor.GetAnalysisUsecase

    @tag :AnalysisTest
    test "add new analysis by persistence adapter" do
        result = Usecase.Luxor.AnalysisUsecaseApi.save(
            %Command.Analysis.SaveAnalysisCommand{
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :AnalysisTest
    test "update analysis by persistence adapter" do
        saved_analysis = Usecase.Luxor.AnalysisUsecaseApi.save(
            %Command.Analysis.SaveAnalysisCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnalysisUsecaseApi.update(
            %Command.Analysis.UpdateAnalysisCommand{
                id: saved_analysis.id,
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :AnalysisTest
    test "remove analysis by persistence adapter" do
        saved_analysis = Usecase.Luxor.AnalysisUsecaseApi.save(
            %Command.Analysis.SaveAnalysisCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnalysisUsecaseApi.delete(
            %Command.Analysis.DeleteAnalysisCommand{
                id: saved_analysis.id
            }
        )
        assert result.name == "teste"
    end

    @tag :AnalysisTest
    test "list analysis by persistence adapter" do
        Usecase.Luxor.AnalysisUsecaseApi.save(
            %Command.Analysis.SaveAnalysisCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnalysisUsecaseApi.list(
            %Command.Analysis.ListAnalysisCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :AnalysisTest
    test "get analysis by persistence adapter" do
        saved_analysis = Usecase.Luxor.AnalysisUsecaseApi.save(
            %Command.Analysis.SaveAnalysisCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnalysisUsecaseApi.get(
            %Command.Analysis.GetAnalysisCommand{
                id: saved_analysis.id
            }
        )
        assert result.name == "teste"
    end
end
