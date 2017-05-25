defmodule Persistence.Luxor.TruckDriverPersistenceAdapterApi do
    @moduledoc ""

    def save(truck_driver = %Luxor.TruckDriver{}) do
        GenServer.call(:truck_driver_persistence_adapter, {:save, truck_driver}, 15_000)
    end

    def update(truck_driver = %Luxor.TruckDriver{}) do
      GenServer.call(:truck_driver_persistence_adapter, {:update, truck_driver}, 15_000)
    end

    def delete(truck_driver = %Luxor.TruckDriver{}) do
      GenServer.call(:truck_driver_persistence_adapter, {:delete, truck_driver}, 15_000)
    end

    def list() do
        GenServer.call(:truck_driver_persistence_adapter, {:list}, 15_000)
    end

    def get(truck_driver = %Luxor.TruckDriver{}) do
        GenServer.call(:truck_driver_persistence_adapter, {:get, truck_driver}, 15_000)
    end
end