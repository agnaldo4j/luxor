defmodule RelationalAdapter.Luxor.DevicePersistenceAdapter do
    @moduledoc ""

    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.DevicePersistenceAdapter, state, opts)
    end

    def handle_call({:save, analysis}, _from, actual_state) do
        analysis |>
        RelationalAdapter.Luxor.Device.from_business |>
        RelationalAdapter.Luxor.DeviceRepository.save |>
        RelationalAdapter.Luxor.Device.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, analysis}, _from, actual_state) do
        analysis.id |>
        RelationalAdapter.Luxor.DeviceRepository.get |>
        RelationalAdapter.Luxor.DeviceRepository.delete |>
        RelationalAdapter.Luxor.Device.to_business |>
        response(actual_state)
    end

    def handle_call({:update, analysis}, _from, actual_state) do
        analysis.id |>
        RelationalAdapter.Luxor.DeviceRepository.get |>
        RelationalAdapter.Luxor.Device.change_state_to(analysis) |>
        RelationalAdapter.Luxor.DeviceRepository.update |>
        RelationalAdapter.Luxor.Device.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.DeviceRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, analysis}, _from, actual_state) do
        analysis.id |>
        RelationalAdapter.Luxor.DeviceRepository.get |>
        RelationalAdapter.Luxor.Device.to_business |>
        response(actual_state)
    end

    defp response(analysis, actual_state) do
        {:reply, analysis, actual_state}
    end

    defp list_to_domain() do
        fn(analysis) -> RelationalAdapter.Luxor.Device.to_business(analysis) end
    end
end
