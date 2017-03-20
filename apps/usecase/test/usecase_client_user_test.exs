defmodule Usecase.ClientUserTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveClientUserUsecase

    @tag :ClientUserTest
    test "add new clientUser by persistence adapter" do
        result = Usecase.Luxor.ClientUserUsecaseApi.save(
            %Command.ClientUser.SaveClientUserCommand{
                name: "Agnaldo de Oliveira",
                email: "agnaldo4j@gmail.com",
                password: "password"
            }
        )
        assert result.client.name == "Agnaldo de Oliveira"
    end

    @tag :ClientUserTest
    test "remove clientUser by persistence adapter" do
        saved = Usecase.Luxor.ClientUserUsecaseApi.save(
            %Command.ClientUser.SaveClientUserCommand{
                name: "Agnaldo de Oliveira",
                email: "agnaldo4j@gmail.com",
                password: "password"
            }
        )

        result = Usecase.Luxor.ClientUserUsecaseApi.update(
            %Command.ClientUser.UpdateClientUserCommand{
                id: saved.id,
                name: "Teste",
                email: "teste@gmail.com",
                password: "novopassword"
            }
        )
        assert result.client.name == "Teste"
    end
end
