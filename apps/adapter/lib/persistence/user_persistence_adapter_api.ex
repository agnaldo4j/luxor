defmodule Persistence.Luxor.UserPersistenceAdapterApi do
    @moduledoc ""

    def save(user = %Luxor.User{}) do
        GenServer.call(:user_persistence_adapter, {:save, user}, 15_000)
    end

    def find_by_email_and_password(user = %Luxor.User{}) do
        GenServer.call(:user_persistence_adapter, {:find_by_email_and_password, user})
    end

end