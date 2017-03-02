defmodule Persistence.Luxor.ClientPersistenceAdapterApi do
    def get_all_devices do
        GenServer.call(:client_persistence_adapter, :get_all_clients)
    end

    def save(client = %Luxor.Client{}) do
        GenServer.call(:client_persistence_adapter, {:save_client, client})
    end

    def find_by_id(id) do
        GenServer.call(:client_persistence_adapter, {:find_client_by_id, id})
    end

end