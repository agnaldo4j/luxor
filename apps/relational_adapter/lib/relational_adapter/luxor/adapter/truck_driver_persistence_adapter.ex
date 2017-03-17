defmodule RelationalAdapter.Luxor.TruckDriverPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.TruckDriverPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_truckDrivers, _from, actual_state) do
        result = RelationalAdapter.Luxor.TruckDriverRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_truckDriver_by_id, truckDriver_id}, _from, actual_state) do
        {:reply, %Luxor.TruckDriver{id: truckDriver_id}, actual_state}
    end

    def handle_call({:save_truckDriver, truckDriver}, _from, actual_state) do
        truckDriver |>
        RelationalAdapter.Luxor.TruckDriver.from_business |>
        RelationalAdapter.Luxor.TruckDriverRepository.save |>
        RelationalAdapter.Luxor.TruckDriver.to_business |>
        save_truckDriver_response(actual_state)
    end

    defp save_truckDriver_response(truckDriver, actual_state) do
        {:reply, truckDriver, actual_state}
    end

    defp list_to_domain() do
        fn(truckDriver) -> RelationalAdapter.Luxor.TruckDriver.to_business(truckDriver) end
    end
end
