defmodule Usecase.FarmTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveFarmUsecase
  doctest Usecase.Luxor.UpdateFarmUsecase
  doctest Usecase.Luxor.DeleteFarmUsecase
  doctest Usecase.Luxor.ListFarmUsecase
  doctest Usecase.Luxor.GetFarmUsecase

    @tag :FarmTest
    test "add new farm by persistence adapter" do
        result = Usecase.Luxor.FarmUsecaseApi.save(
            %Command.Farm.SaveFarmCommand{
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :FarmTest
    test "update farm by persistence adapter" do
        saved_farm = Usecase.Luxor.FarmUsecaseApi.save(
            %Command.Farm.SaveFarmCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.FarmUsecaseApi.update(
            %Command.Farm.UpdateFarmCommand{
                id: saved_farm.id,
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :FarmTest
    test "remove farm by persistence adapter" do
        saved_farm = Usecase.Luxor.FarmUsecaseApi.save(
            %Command.Farm.SaveFarmCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.FarmUsecaseApi.delete(
            %Command.Farm.DeleteFarmCommand{
                id: saved_farm.id
            }
        )
        assert result.name == "teste"
    end

    @tag :FarmTest
    test "list farm by persistence adapter" do
        Usecase.Luxor.FarmUsecaseApi.save(
            %Command.Farm.SaveFarmCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.FarmUsecaseApi.list(
            %Command.Farm.ListFarmCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :FarmTest
    test "get farm by persistence adapter" do
        saved_farm = Usecase.Luxor.FarmUsecaseApi.save(
            %Command.Farm.SaveFarmCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.FarmUsecaseApi.get(
            %Command.Farm.GetFarmCommand{
                id: saved_farm.id
            }
        )
        assert result.name == "teste"
    end
end
