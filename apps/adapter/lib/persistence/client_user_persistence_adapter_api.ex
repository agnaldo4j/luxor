defmodule Persistence.Luxor.ClientUserPersistenceAdapterApi do
    def list do
        GenServer.call(:client_user_persistence_adapter, :list)
    end

    def save(client_user = %Luxor.ClientUser{}) do
        GenServer.call(:client_user_persistence_adapter, {:save, client_user})
    end

    def get(client_user = %Luxor.ClientUser{}) do
        GenServer.call(:client_user_persistence_adapter, {:get, client_user})
    end

end