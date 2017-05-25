defmodule Usecase.TransporterTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveTransporterUsecase
  doctest Usecase.Luxor.UpdateTransporterUsecase
  doctest Usecase.Luxor.DeleteTransporterUsecase
  doctest Usecase.Luxor.ListTransporterUsecase
  doctest Usecase.Luxor.GetTransporterUsecase

    @tag :TransporterTest
    test "add new transporter by persistence adapter" do
        result = Usecase.Luxor.TransporterUsecaseApi.save(
            %Command.Transporter.SaveTransporterCommand{
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :TransporterTest
    test "update transporter by persistence adapter" do
        saved_transporter = Usecase.Luxor.TransporterUsecaseApi.save(
            %Command.Transporter.SaveTransporterCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TransporterUsecaseApi.update(
            %Command.Transporter.UpdateTransporterCommand{
                id: saved_transporter.id,
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :TransporterTest
    test "remove transporter by persistence adapter" do
        saved_transporter = Usecase.Luxor.TransporterUsecaseApi.save(
            %Command.Transporter.SaveTransporterCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TransporterUsecaseApi.delete(
            %Command.Transporter.DeleteTransporterCommand{
                id: saved_transporter.id
            }
        )
        assert result.name == "teste"
    end

    @tag :TransporterTest
    test "list transporter by persistence adapter" do
        Usecase.Luxor.TransporterUsecaseApi.save(
            %Command.Transporter.SaveTransporterCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TransporterUsecaseApi.list(
            %Command.Transporter.ListTransporterCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :TransporterTest
    test "get transporter by persistence adapter" do
        saved_transporter = Usecase.Luxor.TransporterUsecaseApi.save(
            %Command.Transporter.SaveTransporterCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TransporterUsecaseApi.get(
            %Command.Transporter.GetTransporterCommand{
                id: saved_transporter.id
            }
        )
        assert result.name == "teste"
    end
end
