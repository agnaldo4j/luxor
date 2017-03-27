defmodule Usecase.TruckTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveTruckUsecase
  doctest Usecase.Luxor.UpdateTruckUsecase
  doctest Usecase.Luxor.DeleteTruckUsecase
  doctest Usecase.Luxor.ListTruckUsecase
  doctest Usecase.Luxor.GetTruckUsecase

    @tag :TruckTest
    test "add new truck by persistence adapter" do
        result = Usecase.Luxor.TruckUsecaseApi.save(
            %Command.Truck.SaveTruckCommand{
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :TruckTest
    test "update truck by persistence adapter" do
        saved_truck = Usecase.Luxor.TruckUsecaseApi.save(
            %Command.Truck.SaveTruckCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckUsecaseApi.update(
            %Command.Truck.UpdateTruckCommand{
                id: saved_truck.id,
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :TruckTest
    test "remove truck by persistence adapter" do
        saved_truck = Usecase.Luxor.TruckUsecaseApi.save(
            %Command.Truck.SaveTruckCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckUsecaseApi.delete(
            %Command.Truck.DeleteTruckCommand{
                id: saved_truck.id
            }
        )
        assert result.name == "teste"
    end

    @tag :TruckTest
    test "list truck by persistence adapter" do
        Usecase.Luxor.TruckUsecaseApi.save(
            %Command.Truck.SaveTruckCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckUsecaseApi.list(
            %Command.Truck.ListTruckCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :TruckTest
    test "get truck by persistence adapter" do
        saved_truck = Usecase.Luxor.TruckUsecaseApi.save(
            %Command.Truck.SaveTruckCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckUsecaseApi.get(
            %Command.Truck.GetTruckCommand{
                id: saved_truck.id
            }
        )
        assert result.name == "teste"
    end
end
