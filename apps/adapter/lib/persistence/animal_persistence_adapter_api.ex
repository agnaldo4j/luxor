defmodule Persistence.Luxor.AnimalPersistenceAdapterApi do
    def save(animal = %Luxor.Animal{}) do
        GenServer.call(:animal_persistence_adapter, {:save, animal}, 15000)
    end

    def update(animal = %Luxor.Animal{}) do
      GenServer.call(:animal_persistence_adapter, {:update, animal}, 15000)
    end

    def delete(animal = %Luxor.Animal{}) do
      GenServer.call(:animal_persistence_adapter, {:delete, animal}, 15000)
    end

    def list() do
        GenServer.call(:animal_persistence_adapter, {:list}, 15000)
    end

    def get(animal = %Luxor.Animal{}) do
        GenServer.call(:animal_persistence_adapter, {:get, animal}, 15000)
    end
end