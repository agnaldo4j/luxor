defmodule Usecase.ManagerTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveManagerUsecase
  doctest Usecase.Luxor.UpdateManagerUsecase
  doctest Usecase.Luxor.DeleteManagerUsecase
  doctest Usecase.Luxor.ListManagerUsecase
  doctest Usecase.Luxor.GetManagerUsecase

    @tag :ManagerTest
    test "add new manager by persistence adapter" do
        result = Usecase.Luxor.ManagerUsecaseApi.save(
            %Command.Manager.SaveManagerCommand{
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :ManagerTest
    test "update manager by persistence adapter" do
        saved_manager = Usecase.Luxor.ManagerUsecaseApi.save(
            %Command.Manager.SaveManagerCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.ManagerUsecaseApi.update(
            %Command.Manager.UpdateManagerCommand{
                id: saved_manager.id,
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :ManagerTest
    test "remove manager by persistence adapter" do
        saved_manager = Usecase.Luxor.ManagerUsecaseApi.save(
            %Command.Manager.SaveManagerCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.ManagerUsecaseApi.delete(
            %Command.Manager.DeleteManagerCommand{
                id: saved_manager.id
            }
        )
        assert result.name == "teste"
    end

    @tag :ManagerTest
    test "list manager by persistence adapter" do
        Usecase.Luxor.ManagerUsecaseApi.save(
            %Command.Manager.SaveManagerCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.ManagerUsecaseApi.list(
            %Command.Manager.ListManagerCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :ManagerTest
    test "get manager by persistence adapter" do
        saved_manager = Usecase.Luxor.ManagerUsecaseApi.save(
            %Command.Manager.SaveManagerCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.ManagerUsecaseApi.get(
            %Command.Manager.GetManagerCommand{
                id: saved_manager.id
            }
        )
        assert result.name == "teste"
    end
end
