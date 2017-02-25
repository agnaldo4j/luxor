defmodule Github.Kaizen.GithubAdapterApi do
    def get_user_info(command = %Command.Github.GetUserInfoCommand{}) do
        GenServer.call(:github_adapter, {:user_info, command.token})
    end

    def get_user_repositories(command = %Command.Github.GetUserRepositoriesCommand{}) do
        GenServer.call(:github_adapter, {:repositories, command.token})
    end

    def get_user_organizations(command = %Command.Github.GetUserOrganizationsCommand{}) do
        GenServer.call(:github_adapter, {:organizations, command.token})
    end
end