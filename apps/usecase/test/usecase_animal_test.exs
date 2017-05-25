defmodule Usecase.AnimalTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveAnimalUsecase
  doctest Usecase.Luxor.UpdateAnimalUsecase
  doctest Usecase.Luxor.DeleteAnimalUsecase
  doctest Usecase.Luxor.ListAnimalUsecase
  doctest Usecase.Luxor.GetAnimalUsecase

    defp create_producer() do
        Usecase.Luxor.ProducerUsecaseApi.save(
            %Command.Producer.SaveProducerCommand{
                name: "teste",
                sex: "male",
                cpf: "11111111111",
                phone: "4799715555"
            }
        )
    end

    @tag :AnimalTest
    test "add new animal by persistence adapter" do
        saved_producer = create_producer()
        result = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                register_number: "123456789",
                breed: "teste",
                producer_id: saved_producer.id
            }
        )
        assert result.register_number == "123456789"
    end


    @tag :AnimalTest
    test "update animal by persistence adapter" do
        saved_producer = create_producer()
        saved_animal = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                register_number: "123456789",
                breed: "teste",
                producer_id: saved_producer.id
            }
        )

        new_producer = create_producer()
        result = Usecase.Luxor.AnimalUsecaseApi.update(
            %Command.Animal.UpdateAnimalCommand {
                id: saved_animal.id,
                register_number: "098765431",
                breed: "nova",
                producer_id: new_producer.id
            }
        )
        assert result.register_number == "098765431"
    end

    @tag :AnimalTest
    test "remove animal by persistence adapter" do
        saved_producer = create_producer()
        saved_animal = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                register_number: "123456789",
                breed: "teste",
                producer_id: saved_producer.id
            }
        )

        result = Usecase.Luxor.AnimalUsecaseApi.delete(
            %Command.Animal.DeleteAnimalCommand{
                id: saved_animal.id
            }
        )
        assert result.register_number == "123456789"
    end

    @tag :AnimalTest
    test "list animal by persistence adapter" do
        saved_producer = create_producer()
        Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                register_number: "123456789",
                breed: "teste",
                producer_id: saved_producer.id
            }
        )

        result = Usecase.Luxor.AnimalUsecaseApi.list(
            %Command.Animal.ListAnimalCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :AnimalTest
    test "get animal by persistence adapter" do
        saved_producer = create_producer()
        saved_animal = Usecase.Luxor.AnimalUsecaseApi.save(
            %Command.Animal.SaveAnimalCommand{
                register_number: "123456789",
                breed: "teste",
                producer_id: saved_producer.id
            }
        )

        result = Usecase.Luxor.AnimalUsecaseApi.get(
            %Command.Animal.GetAnimalCommand{
                id: saved_animal.id
            }
        )
        assert result.register_number == "123456789"
    end
end
