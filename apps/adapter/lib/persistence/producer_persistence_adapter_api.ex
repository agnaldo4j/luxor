defmodule Persistence.Luxor.ProducerPersistenceAdapterApi do
    def save(producer = %Luxor.Producer{}) do
        GenServer.call(:producer_persistence_adapter, {:save, producer})
    end

    def update(producer = %Luxor.Producer{}) do
      GenServer.call(:producer_persistence_adapter, {:update, producer})
    end

    def delete(producer = %Luxor.Producer{}) do
      GenServer.call(:producer_persistence_adapter, {:delete, producer})
    end

    def list() do
        GenServer.call(:producer_persistence_adapter, {:list})
    end

    def get(producer = %Luxor.Producer{}) do
        GenServer.call(:producer_persistence_adapter, {:get, producer})
    end
end