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
                password: "01aa01",
                active: true
            }
        )
        assert result.email == "teste@teste.com"
    end
end
