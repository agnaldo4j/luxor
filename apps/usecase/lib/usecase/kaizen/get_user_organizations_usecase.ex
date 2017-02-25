defmodule Usecase.Kaizen.GetUserOrganizationsUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Kaizen.GetUserOrganizationsUsecase, state, opts)
    end

    def handle_call({:organizations, command = %Command.User.GetUserOrganizationsCommand{}}, _from, actual_state) do
        user_organizations = get_user_organizations(command)
        {:reply, user_organizations, actual_state}
    end

    defp get_user_organizations(command = %Command.User.GetUserOrganizationsCommand{}) do
        %Command.Github.GetUserOrganizationsCommand{token: command.github_token} |>
        Github.Kaizen.GithubAdapterApi.get_user_organizations
        # |> Persistence.Kaizen.UserPersistenceAdapterApi.save
    end
end