defmodule RelationalAdapter.Luxor.ClientPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.ClientPersistenceAdapter, state, opts)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.ClientRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, client}, _from, actual_state) do
        {:reply, %Luxor.Client{id: client}, actual_state}
    end

    def handle_call({:save, client}, _from, actual_state) do
        client |>
        RelationalAdapter.Luxor.Client.from_business |>
        RelationalAdapter.Luxor.ClientRepository.save |>
        RelationalAdapter.Luxor.Client.to_business |>
        save_client_response(actual_state)
    end

    defp save_client_response(client, actual_state) do
        {:reply, client, actual_state}
    end

    defp list_to_domain() do
        fn(client) -> RelationalAdapter.Luxor.Client.to_business(client) end
    end
end
