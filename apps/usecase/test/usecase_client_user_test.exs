defmodule Usecase.ClientUserTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveClientUserUsecase
  doctest Usecase.Luxor.UpdateClientUserUsecase
  doctest Usecase.Luxor.DeleteClientUserUsecase
  doctest Usecase.Luxor.ListClientUserUsecase
  doctest Usecase.Luxor.GetClientUserUsecase

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
    test "update clientUser by persistence adapter" do
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

    @tag :ClientUserTest
    test "remove clientUser by persistence adapter" do
        saved = Usecase.Luxor.ClientUserUsecaseApi.save(
            %Command.ClientUser.SaveClientUserCommand{
                name: "Agnaldo de Oliveira",
                email: "agnaldo4j@gmail.com",
                password: "password"
            }
        )

        result = Usecase.Luxor.ClientUserUsecaseApi.delete(
            %Command.ClientUser.DeleteClientUserCommand{
                id: saved.id
            }
        )
        assert result.client.name == "Agnaldo de Oliveira"
    end

    @tag :ClientUserTest
    test "list clientUser by persistence adapter" do
        Usecase.Luxor.ClientUserUsecaseApi.save(
            %Command.ClientUser.SaveClientUserCommand{
                name: "Agnaldo de Oliveira",
                email: "agnaldo4j@gmail.com",
                password: "password"
            }
        )

        result = Usecase.Luxor.ClientUserUsecaseApi.list(
            %Command.ClientUser.ListClientUserCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :ClientUserTest
    test "get clientUser by persistence adapter" do
        saved = Usecase.Luxor.ClientUserUsecaseApi.save(
            %Command.ClientUser.SaveClientUserCommand{
                name: "Agnaldo de Oliveira",
                email: "agnaldo4j@gmail.com",
                password: "password"
            }
        )

        result = Usecase.Luxor.ClientUserUsecaseApi.get(
            %Command.ClientUser.GetClientUserCommand{
                id: saved.id
            }
        )
        assert result.client.name == "Agnaldo de Oliveira"
    end
end
