defmodule Persistence.Luxor.ClientUserPersistenceAdapterApi do
    def get_all_client_user do
        GenServer.call(:client_user_persistence_adapter, :get_all_client_users)
    end

    def save(client_user = %Luxor.ClientUser{}) do
        GenServer.call(:client_user_persistence_adapter, {:save_client_user, client_user})
    end

    def find_by_id(id) do
        GenServer.call(:client_user_persistence_adapter, {:find_client_user_by_id, id})
    end

end