defmodule Persistence.Luxor.DevicePersistenceAdapterApi do
    @moduledoc ""

    def save(device = %Luxor.Device{}) do
        GenServer.call(:device_persistence_adapter, {:save, device}, 15_000)
    end

    def update(device = %Luxor.Device{}) do
      GenServer.call(:device_persistence_adapter, {:update, device}, 15_000)
    end

    def delete(device = %Luxor.Device{}) do
      GenServer.call(:device_persistence_adapter, {:delete, device}, 15_000)
    end

    def list() do
        GenServer.call(:device_persistence_adapter, {:list}, 15_000)
    end

    def get(device = %Luxor.Device{}) do
        GenServer.call(:device_persistence_adapter, {:get, device}, 15_000)
    end
end