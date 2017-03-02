defmodule Usecase.UserTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.AddUserUsecase

    test "add new user by persistence adapter" do
        command = %Command.User.AddNewUserCommand{email: "agnaldo4j@gmail.com", password: "password", active: true}
        result = Usecase.Luxor.UserUsecaseApi.add_new_user(command)
        assert result.email == "agnaldo4j@gmail.com"
    end
end
