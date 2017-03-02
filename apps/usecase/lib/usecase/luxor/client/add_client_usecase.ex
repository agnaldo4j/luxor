defmodule Usecase.Luxor.AddClientUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.AddClientUsecase, state, opts)
    end

    def handle_call({:add_new_client, command = %Command.Client.AddNewClientCommand{}}, _from, actual_state) do
        saved_client_model = add_new_client(command)
        {:reply, saved_client_model, actual_state}
    end

    defp add_new_client(command = %Command.Client.AddNewClientCommand{}) do
        %Luxor.Client{name: command.name} |>
        Luxor.Client.identify |>
        Persistence.Luxor.ClientPersistenceAdapterApi.save
    end
end