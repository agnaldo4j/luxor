defmodule Persistence.Luxor.ClientUserPersistenceAdapterApi do
    @moduledoc ""

    def save(client_user = %Luxor.ClientUser{}) do
        GenServer.call(:client_user_persistence_adapter, {:save, client_user}, 15_000)
    end

    def update(client_user = %Luxor.ClientUser{}) do
        GenServer.call(:client_user_persistence_adapter, {:update, client_user}, 15_000)
    end

    def delete(client_user = %Luxor.ClientUser{}) do
        GenServer.call(:client_user_persistence_adapter, {:delete, client_user}, 15_000)
    end

    def list do
        GenServer.call(:client_user_persistence_adapter, {:list}, 15_000)
    end

    def get(client_user = %Luxor.ClientUser{}) do
        GenServer.call(:client_user_persistence_adapter, {:get, client_user}, 15_000)
    end
end
