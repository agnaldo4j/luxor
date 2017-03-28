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
        assert result.email == "teste@teste.com"
    end

    @tag :UserTest
    test "authentication user by persistence adapter" do
        saved_user = Usecase.Luxor.UserUsecaseApi.save(
            %Command.User.SaveUserCommand{
                email: "teste@teste.com",
                password: UUID.uuid4(),
                active: true
            }
        )

        result = Usecase.Luxor.UserUsecaseApi.authenticate(
            %Command.User.AuthenticationUserCommand{
                email: "teste@teste.com",
                password: saved_user.password
            }
        )
        assert result.email == "teste@teste.com"
    end

    @tag :UserTest
    test "authentication user not found by persistence adapter" do
        result = Usecase.Luxor.UserUsecaseApi.authenticate(
            %Command.User.AuthenticationUserCommand{
                email: "teste@teste.com",
                password: UUID.uuid4()
            }
        )
        assert result == nil
    end
end
