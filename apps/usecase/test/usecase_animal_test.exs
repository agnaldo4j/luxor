defmodule Usecase.AnimalTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveAnimalUsecase
  doctest Usecase.Luxor.UpdateAnimalUsecase
  doctest Usecase.Luxor.DeleteAnimalUsecase
  doctest Usecase.Luxor.ListAnimalUsecase
  doctest Usecase.Luxor.GetAnimalUsecase

    @tag :AnimalTest
    test "add new animal by persistence adapter" do
        result = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :AnimalTest
    test "update animal by persistence adapter" do
        saved_animal = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnimalUsecaseApi.update(
            %Command.Animal.UpdateAnimalCommand{
                id: saved_animal.id,
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :AnimalTest
    test "remove animal by persistence adapter" do
        saved_animal = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnimalUsecaseApi.delete(
            %Command.Animal.DeleteAnimalCommand{
                id: saved_animal.id
            }
        )
        assert result.name == "teste"
    end

    @tag :AnimalTest
    test "list animal by persistence adapter" do
        Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnimalUsecaseApi.list(
            %Command.Animal.ListAnimalCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :AnimalTest
    test "get animal by persistence adapter" do
        saved_animal = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                name: "teste"
            }
        )

        result = Usecase.Luxor.AnimalUsecaseApi.get(
            %Command.Animal.GetAnimalCommand{
                id: saved_animal.id
            }
        )
        assert result.name == "teste"
    end
end
