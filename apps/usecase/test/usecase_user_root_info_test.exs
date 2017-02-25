defmodule Usecase.UserRootInfoTest do
  use ExUnit.Case, async: true
  doctest Usecase.Kaizen.GetUserRootInfoUsecase

  test "get user root info" do
    command = %Command.User.GetUserRootInfoCommand{github_token: '87224a8528cde2c1a2650015e842dadc39573727'}
    result = Usecase.Kaizen.GetUserRootInfoUsecaseApi.get_user_root_info(command)
    assert Enum.empty?(result.organizations) == false
    assert Enum.empty?(result.repositories) == false
  end

end
