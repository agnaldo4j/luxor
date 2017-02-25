defmodule Usecase.UserTest do
  use ExUnit.Case, async: true
  doctest Usecase.Kaizen.AddUserUsecase

    test "add new user by persistence adapter" do
        command = %Command.User.AddNewUserCommand{github_token: '87224a8528cde2c1a2650015e842dadc39573727'}
        result = Usecase.Kaizen.AddUserUsecaseApi.add_new_user(command)
        assert result.email == "agnaldo4j@gmail.com"
    end
end
