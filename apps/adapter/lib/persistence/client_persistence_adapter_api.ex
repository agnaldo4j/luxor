defmodule Persistence.Luxor.ClientPersistenceAdapterApi do
    def list do
        GenServer.call(:client_persistence_adapter, :list)
    end

    def save(client = %Luxor.Client{}) do
        GenServer.call(:client_persistence_adapter, {:save, client})
    end

    def get(client = %Luxor.Client{}) do
        GenServer.call(:client_persistence_adapter, {:get, client})
    end

end