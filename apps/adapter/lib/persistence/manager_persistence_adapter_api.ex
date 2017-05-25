defmodule Persistence.Luxor.ManagerPersistenceAdapterApi do
    @moduledoc ""

    def save(manager = %Luxor.Manager{}) do
        GenServer.call(:manager_persistence_adapter, {:save, manager}, 15_000)
    end

    def update(manager = %Luxor.Manager{}) do
      GenServer.call(:manager_persistence_adapter, {:update, manager}, 15_000)
    end

    def delete(manager = %Luxor.Manager{}) do
      GenServer.call(:manager_persistence_adapter, {:delete, manager}, 15_000)
    end

    def list() do
        GenServer.call(:manager_persistence_adapter, {:list}, 15_000)
    end

    def get(manager = %Luxor.Manager{}) do
        GenServer.call(:manager_persistence_adapter, {:get, manager}, 15_000)
    end
end