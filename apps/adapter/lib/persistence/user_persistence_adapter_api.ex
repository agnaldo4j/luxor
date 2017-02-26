defmodule Persistence.Luxor.UserPersistenceAdapterApi do
    def get_all_users do
        GenServer.call(:user_persistence_adapter, :get_all_users)
    end

    def save(user = %Luxor.User{}) do
        GenServer.call(:user_persistence_adapter, {:save_user, user})
    end

    def find_by_id(id) do
        GenServer.call(:user_persistence_adapter, {:find_user_by_id, id})
    end

end