defmodule Persistence.Luxor.AnimalPersistenceAdapterApi do
    def save(animal = %Luxor.Animal{}) do
        GenServer.call(:animal_persistence_adapter, {:save, animal})
    end

    def update(animal = %Luxor.Animal{}) do
      GenServer.call(:animal_persistence_adapter, {:update, animal})
    end

    def delete(animal = %Luxor.Animal{}) do
      GenServer.call(:animal_persistence_adapter, {:delete, animal})
    end

    def list() do
        GenServer.call(:animal_persistence_adapter, {:list})
    end

    def get(animal = %Luxor.Animal{}) do
        GenServer.call(:animal_persistence_adapter, {:get, animal})
    end
end