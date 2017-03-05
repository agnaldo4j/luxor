defmodule Usecase.ClientTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.AddClientUsecase

    test "add new client by persistence adapter" do
        command = %Command.Client.AddNewClientCommand{name: "Agnaldo de Oliveira", email: "agnaldo4j@gmail.com", password: "password"}
        result = Usecase.Luxor.ClientUsecaseApi.add_new_client(command)
        assert result.name == "Agnaldo de Oliveira"
    end
end
