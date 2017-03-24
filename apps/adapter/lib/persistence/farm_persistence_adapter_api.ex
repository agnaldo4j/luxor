defmodule Persistence.Luxor.FarmPersistenceAdapterApi do
    def save(farm = %Luxor.Farm{}) do
        GenServer.call(:farm_persistence_adapter, {:save, farm})
    end

    def update(farm = %Luxor.Farm{}) do
      GenServer.call(:farm_persistence_adapter, {:update, farm})
    end

    def delete(farm = %Luxor.Farm{}) do
      GenServer.call(:farm_persistence_adapter, {:delete, farm})
    end

    def list() do
        GenServer.call(:farm_persistence_adapter, {:list})
    end

    def get(farm = %Luxor.Farm{}) do
        GenServer.call(:farm_persistence_adapter, {:get, farm})
    end
end