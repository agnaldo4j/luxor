defmodule Usecase.Luxor.UpdateClientUserUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateClientUserUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.ClientUser.UpdateClientUserCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.ClientUser.UpdateClientUserCommand{}) do
        client = build_client_with(command)
        user = build_user_with(command)

        %Luxor.ClientUser{id: command.id, client: client, user: user} |>
        Persistence.Luxor.ClientUserPersistenceAdapterApi.update
    end

    defp build_client_with(command) do
      %Luxor.Client{name: command.name}
    end

    defp build_user_with(command) do
      %Luxor.User{email: command.email, password: command.password, active: true}
    end
end