defmodule Usecase.ProducerTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveProducerUsecase
  doctest Usecase.Luxor.UpdateProducerUsecase
  doctest Usecase.Luxor.DeleteProducerUsecase
  doctest Usecase.Luxor.ListProducerUsecase
  doctest Usecase.Luxor.GetProducerUsecase

    @tag :ProducerTest
    test "add new producer by persistence adapter" do
        result = Usecase.Luxor.ProducerUsecaseApi.save(
            %Command.Producer.SaveProducerCommand{
                name: "teste",
                sex: "male",
                cpf: "11111111111",
                phone: "4799715555"
            }
        )
        assert result.name == "teste"
    end

    @tag :ProducerTest
    test "update producer by persistence adapter" do
        saved_producer = Usecase.Luxor.ProducerUsecaseApi.save(
            %Command.Producer.SaveProducerCommand{
                name: "teste",
                sex: "male",
                cpf: "11111111111",
                phone: "4799715555"
            }
        )

        result = Usecase.Luxor.ProducerUsecaseApi.update(
            %Command.Producer.UpdateProducerCommand{
                id: saved_producer.id,
                name: "teste2",
                sex: "female",
                cpf: "22222222222",
                phone: "4799715556"
            }
        )
        assert result.name == "teste2"
        assert result.sex == "female"
        assert result.cpf == "22222222222"
        assert result.phone == "4799715556"
    end

    @tag :ProducerTest
    test "remove producer by persistence adapter" do
        saved_producer = Usecase.Luxor.ProducerUsecaseApi.save(
            %Command.Producer.SaveProducerCommand{
                name: "teste",
                sex: "male",
                cpf: "11111111111",
                phone: "4799715555"
            }
        )

        result = Usecase.Luxor.ProducerUsecaseApi.delete(
            %Command.Producer.DeleteProducerCommand{
                id: saved_producer.id
            }
        )
        assert result.name == "teste"
    end

    @tag :ProducerTest
    test "list producer by persistence adapter" do
        Usecase.Luxor.ProducerUsecaseApi.save(
            %Command.Producer.SaveProducerCommand{
                name: "teste",
                sex: "male",
                cpf: "11111111111",
                phone: "4799715555"
            }
        )

        result = Usecase.Luxor.ProducerUsecaseApi.list(
            %Command.Producer.ListProducerCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :ProducerTest
    test "get producer by persistence adapter" do
        saved_producer = Usecase.Luxor.ProducerUsecaseApi.save(
            %Command.Producer.SaveProducerCommand{
                name: "teste",
                sex: "male",
                cpf: "11111111111",
                phone: "4799715555"
            }
        )

        result = Usecase.Luxor.ProducerUsecaseApi.get(
            %Command.Producer.GetProducerCommand{
                id: saved_producer.id
            }
        )
        assert result.name == "teste"
    end
end
