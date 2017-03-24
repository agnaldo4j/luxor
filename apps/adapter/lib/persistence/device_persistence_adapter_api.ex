defmodule Persistence.Luxor.DevicePersistenceAdapterApi do
    def save(device = %Luxor.Device{}) do
        GenServer.call(:device_persistence_adapter, {:save, device}, 15000)
    end

    def update(device = %Luxor.Device{}) do
      GenServer.call(:device_persistence_adapter, {:update, device}, 15000)
    end

    def delete(device = %Luxor.Device{}) do
      GenServer.call(:device_persistence_adapter, {:delete, device}, 15000)
    end

    def list() do
        GenServer.call(:device_persistence_adapter, {:list}, 15000)
    end

    def get(device = %Luxor.Device{}) do
        GenServer.call(:device_persistence_adapter, {:get, device}, 15000)
    end
end