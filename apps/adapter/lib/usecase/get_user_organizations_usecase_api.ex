defmodule Usecase.Luxor.GetUserOrganizationsUsecaseApi do
    def get_user_organizations(command = %Command.User.GetUserOrganizationsCommand{}) do
        GenServer.call(:get_user_organizations_usecase, {:organizations, command})
    end
end