defmodule Usecase.ClientUserTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveClientUserUsecase

    @tag :wip
    test "add new client by persistence adapter" do
        command = %Command.ClientUser.SaveClientUserCommand{name: "Agnaldo de Oliveira", email: "agnaldo4j@gmail.com", password: "password"}
        result = Usecase.Luxor.ClientUserUsecaseApi.save(command)
        assert result.name == "Agnaldo de Oliveira"
    end
end
