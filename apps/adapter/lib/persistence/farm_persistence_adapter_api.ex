defmodule Persistence.Luxor.FarmPersistenceAdapterApi do
    def save(farm = %Luxor.Farm{}) do
        GenServer.call(:farm_persistence_adapter, {:save, farm}, 15000)
    end

    def update(farm = %Luxor.Farm{}) do
      GenServer.call(:farm_persistence_adapter, {:update, farm}, 15000)
    end

    def delete(farm = %Luxor.Farm{}) do
      GenServer.call(:farm_persistence_adapter, {:delete, farm}, 15000)
    end

    def list() do
        GenServer.call(:farm_persistence_adapter, {:list}, 15000)
    end

    def get(farm = %Luxor.Farm{}) do
        GenServer.call(:farm_persistence_adapter, {:get, farm}, 15000)
    end
end