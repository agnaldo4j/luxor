defmodule Usecase.OrganizationsTest do
  use ExUnit.Case, async: true
  doctest Usecase.Kaizen.GetUserOrganizationsUsecase

    test "get user organizations" do
        command = %Command.User.GetUserOrganizationsCommand{github_token: '87224a8528cde2c1a2650015e842dadc39573727'}
        result = Usecase.Kaizen.GetUserOrganizationsUsecaseApi.get_user_organizations(command)
        assert Enum.empty?(result) == false
    end
end
