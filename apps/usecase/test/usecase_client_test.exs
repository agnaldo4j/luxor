defmodule Usecase.ClientTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveClientUsecase

    @tag :wip
    test "add new client by persistence adapter" do
        command = %Command.Client.SaveClientCommand{name: "Agnaldo de Oliveira", email: "agnaldo4j@gmail.com", password: "password"}
        result = Usecase.Luxor.ClientUsecaseApi.save(command)
        assert result.name == "Agnaldo de Oliveira"
    end
end
