defmodule Usecase.Luxor.SaveClientUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveClientUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Client.SaveClientCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Client.SaveClientCommand{}) do
        client = build_client_with(command)
        user = build_user_with(command)

        %Luxor.ClientUser{client: client, user: user} |>
        Luxor.ClientUser.identify |>
        Persistence.Luxor.ClientUserPersistenceAdapterApi.save
    end

    defp build_client_with(command) do
      %Luxor.Client{name: command.name} |>
      Luxor.Client.identify
    end

    defp build_user_with(command) do
      %Luxor.User{email: command.email, password: command.password, active: true} |>
      Luxor.User.identify
    end
end