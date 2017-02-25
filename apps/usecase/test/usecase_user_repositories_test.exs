defmodule Usecase.RepositoriesTest do
  use ExUnit.Case, async: true
  doctest Usecase.Kaizen.GetUserRepositoriesUsecase

    test "get user repositories" do
        command = %Command.User.GetUserRepositoriesCommand{github_token: '87224a8528cde2c1a2650015e842dadc39573727'}
        result = Usecase.Kaizen.GetUserRepositoriesUsecaseApi.get_user_repositories(command)
        assert Enum.empty?(result) == false
    end

end
