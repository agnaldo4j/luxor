defmodule Persistence.Luxor.TruckPersistenceAdapterApi do
    @moduledoc ""

    def save(truck = %Luxor.Truck{}) do
        GenServer.call(:truck_persistence_adapter, {:save, truck}, 15_000)
    end

    def update(truck = %Luxor.Truck{}) do
      GenServer.call(:truck_persistence_adapter, {:update, truck}, 15_000)
    end

    def delete(truck = %Luxor.Truck{}) do
      GenServer.call(:truck_persistence_adapter, {:delete, truck}, 15_000)
    end

    def list() do
        GenServer.call(:truck_persistence_adapter, {:list}, 15_000)
    end

    def get(truck = %Luxor.Truck{}) do
        GenServer.call(:truck_persistence_adapter, {:get, truck}, 15_000)
    end
end