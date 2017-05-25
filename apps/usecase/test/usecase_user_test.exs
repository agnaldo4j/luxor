defmodule Usecase.UserTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveUserUsecase
  #doctest Usecase.Luxor.UpdateUserUsecase
  #doctest Usecase.Luxor.DeleteUserUsecase
  #doctest Usecase.Luxor.ListUserUsecase
  #doctest Usecase.Luxor.GetUserUsecase

    @tag :UserTest
    test "add new user by persistence adapter" do
        result = Usecase.Luxor.UserUsecaseApi.save(
            %Command.User.SaveUserCommand{
                email: "teste@teste.com",
                password: UUID.uuid4(),
                active: true
            }
        )
        {:ok, user} = result
        assert user.email == "teste@teste.com"
    end

    @tag :UserTest
    test "wrong parameter when save new user by persistence adapter" do
        result = Usecase.Luxor.UserUsecaseApi.save(
            %Command.User.SaveUserCommand{
                email: "teste@teste.com",
                active: true
            }
        )
        {:error, errors} = result
        assert errors == [password: {"can't be blank", []}]
    end

    @tag :UserTest
    test "authentication user by persistence adapter" do
        {:ok, user} = Usecase.Luxor.UserUsecaseApi.save(
            %Command.User.SaveUserCommand{
                email: "teste@teste.com",
                password: UUID.uuid4(),
                active: true
            }
        )

        result = Usecase.Luxor.UserUsecaseApi.authenticate(
            %Command.User.AuthenticationUserCommand{
                email: "teste@teste.com",
                password: user.password
            }
        )
        {:ok, user} = result
        assert user.email == "teste@teste.com"
    end

    @tag :UserTest
    test "authentication user not found by persistence adapter" do
        result = Usecase.Luxor.UserUsecaseApi.authenticate(
            %Command.User.AuthenticationUserCommand{
                email: "teste@teste.com",
                password: UUID.uuid4()
            }
        )
        {:error, errors} = result
        assert errors == [password: {"maybe can be Wrong", []}, email: {"maybe can be Wrong", []}]
    end
end