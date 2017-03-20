defmodule Persistence.Luxor.ProducerPersistenceAdapterApi do
    def get_all_producers do
        GenServer.call(:producer_persistence_adapter, :list)
    end

    def save(producer = %Luxor.Producer{}) do
        GenServer.call(:producer_persistence_adapter, {:save, producer})
    end

    def delete(producer = %Luxor.Producer{}) do
      GenServer.call(:producer_persistence_adapter, {:delete, producer})
    end

    def update(producer = %Luxor.Producer{}) do
      GenServer.call(:producer_persistence_adapter, {:update, producer})
    end

    def find_by_id(id) do
        GenServer.call(:producer_persistence_adapter, {:find_by_id, id})
    end

    def list() do
        GenServer.call(:producer_persistence_adapter, {:list})
    end
end