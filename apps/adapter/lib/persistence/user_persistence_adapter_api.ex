defmodule Persistence.Luxor.UserPersistenceAdapterApi do
    def save(user = %Luxor.User{}) do
        GenServer.call(:user_persistence_adapter, {:save, user}, 15000)
    end

    def find_by_email_and_password(email, password) do
        GenServer.call(:user_persistence_adapter, {:find_by_email_and_password, {email, password}})
    end

end