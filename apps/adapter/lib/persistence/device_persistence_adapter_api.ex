defmodule Persistence.Luxor.DevicePersistenceAdapterApi do
    def get_all_devices do
        GenServer.call(:device_persistence_adapter, :get_all_devices)
    end

    def save(device = %Luxor.Device{}) do
        GenServer.call(:device_persistence_adapter, {:save_device, device})
    end

    def find_by_id(id) do
        GenServer.call(:device_persistence_adapter, {:find_device_by_id, id})
    end

end