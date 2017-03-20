defmodule Persistence.Luxor.ProducerPersistenceAdapterApi do
    def get_all_producers do
        GenServer.call(:producer_persistence_adapter, :get_all_producers)
    end

    def save(producer = %Luxor.Producer{}) do
        GenServer.call(:producer_persistence_adapter, {:save_producer, producer})
    end

    def find_by_id(id) do
        GenServer.call(:producer_persistence_adapter, {:find_producer_by_id, id})
    end

end