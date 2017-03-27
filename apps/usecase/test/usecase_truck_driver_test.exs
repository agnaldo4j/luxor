defmodule Usecase.TruckDriverTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveTruckDriverUsecase
  doctest Usecase.Luxor.UpdateTruckDriverUsecase
  doctest Usecase.Luxor.DeleteTruckDriverUsecase
  doctest Usecase.Luxor.ListTruckDriverUsecase
  doctest Usecase.Luxor.GetTruckDriverUsecase

    @tag :TruckDriverTest
    test "add new truck_driver by persistence adapter" do
        result = Usecase.Luxor.TruckDriverUsecaseApi.save(
            %Command.TruckDriver.SaveTruckDriverCommand{
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :TruckDriverTest
    test "update truck_driver by persistence adapter" do
        saved_truck_driver = Usecase.Luxor.TruckDriverUsecaseApi.save(
            %Command.TruckDriver.SaveTruckDriverCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckDriverUsecaseApi.update(
            %Command.TruckDriver.UpdateTruckDriverCommand{
                id: saved_truck_driver.id,
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :TruckDriverTest
    test "remove truck_driver by persistence adapter" do
        saved_truck_driver = Usecase.Luxor.TruckDriverUsecaseApi.save(
            %Command.TruckDriver.SaveTruckDriverCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckDriverUsecaseApi.delete(
            %Command.TruckDriver.DeleteTruckDriverCommand{
                id: saved_truck_driver.id
            }
        )
        assert result.name == "teste"
    end

    @tag :TruckDriverTest
    test "list truck_driver by persistence adapter" do
        Usecase.Luxor.TruckDriverUsecaseApi.save(
            %Command.TruckDriver.SaveTruckDriverCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckDriverUsecaseApi.list(
            %Command.TruckDriver.ListTruckDriverCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :TruckDriverTest
    test "get truck_driver by persistence adapter" do
        saved_truck_driver = Usecase.Luxor.TruckDriverUsecaseApi.save(
            %Command.TruckDriver.SaveTruckDriverCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.TruckDriverUsecaseApi.get(
            %Command.TruckDriver.GetTruckDriverCommand{
                id: saved_truck_driver.id
            }
        )
        assert result.name == "teste"
    end
end
