defmodule Persistence.Luxor.ProducerPersistenceAdapterApi do
    @moduledoc ""

    def save(producer = %Luxor.Producer{}) do
        GenServer.call(:producer_persistence_adapter, {:save, producer}, 15_000)
    end

    def update(producer = %Luxor.Producer{}) do
      GenServer.call(:producer_persistence_adapter, {:update, producer}, 15_000)
    end

    def delete(producer = %Luxor.Producer{}) do
      GenServer.call(:producer_persistence_adapter, {:delete, producer}, 15_000)
    end

    def list() do
        GenServer.call(:producer_persistence_adapter, {:list}, 15_000)
    end

    def get(producer = %Luxor.Producer{}) do
        GenServer.call(:producer_persistence_adapter, {:get, producer}, 15_000)
    end
end