defmodule Persistence.Luxor.DevicePersistenceAdapterApi do
    def save(device = %Luxor.Device{}) do
        GenServer.call(:device_persistence_adapter, {:save, device})
    end

    def update(device = %Luxor.Device{}) do
      GenServer.call(:device_persistence_adapter, {:update, device})
    end

    def delete(device = %Luxor.Device{}) do
      GenServer.call(:device_persistence_adapter, {:delete, device})
    end

    def list() do
        GenServer.call(:device_persistence_adapter, {:list})
    end

    def get(device = %Luxor.Device{}) do
        GenServer.call(:device_persistence_adapter, {:get, device})
    end
end