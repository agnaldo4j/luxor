defmodule RelationalAdapter.Luxor.DevicePersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.DevicePersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_devices, _from, actual_state) do
        result = RelationalAdapter.Luxor.DeviceRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_device_by_id, device_id}, _from, actual_state) do
        {:reply, %Luxor.Device{id: device_id}, actual_state}
    end

    def handle_call({:save_device, device}, _from, actual_state) do
        device |>
        RelationalAdapter.Luxor.Device.from_business |>
        RelationalAdapter.Luxor.DeviceRepository.save |>
        RelationalAdapter.Luxor.Device.to_business |>
        save_device_response(actual_state)
    end

    defp save_device_response(device, actual_state) do
        {:reply, device, actual_state}
    end

    defp list_to_domain() do
        fn(device) -> RelationalAdapter.Luxor.Device.to_business(device) end
    end
end
