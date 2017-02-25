defmodule Persistence.Kaizen.UserPersistenceAdapterApi do
    def get_all_users do
        GenServer.call(:db_server, :get_all_users)
    end

    def save(userModel = %Kaizen.User{}) do
        GenServer.call(:db_server, {:save_user, userModel})
    end

    def find_by_id(id) do
        GenServer.call(:db_server, {:find_user_by_id, id})
    end

end