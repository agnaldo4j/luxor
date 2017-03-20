defmodule Usecase.ProducerTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.AddProducerUsecase

    @tag :wip
    test "add new producer by persistence adapter" do
        command = %Command.Producer.AddNewProducerCommand{name: "teste", sex: "male", cpf: "11111111111", phone: "4799715555"}
        result = Usecase.Luxor.ProducerUsecaseApi.add_new_producer(command)
        assert result.name == "teste"
    end
end
