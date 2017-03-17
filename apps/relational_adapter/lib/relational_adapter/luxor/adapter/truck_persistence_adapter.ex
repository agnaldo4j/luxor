defmodule RelationalAdapter.Luxor.TruckPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.TruckPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_trucks, _from, actual_state) do
        result = RelationalAdapter.Luxor.TruckRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_truck_by_id, truck_id}, _from, actual_state) do
        {:reply, %Luxor.Truck{id: truck_id}, actual_state}
    end

    def handle_call({:save_truck, truck}, _from, actual_state) do
        truck |>
        RelationalAdapter.Luxor.Truck.from_business |>
        RelationalAdapter.Luxor.TruckRepository.save |>
        RelationalAdapter.Luxor.Truck.to_business |>
        save_truck_response(actual_state)
    end

    defp save_truck_response(truck, actual_state) do
        {:reply, truck, actual_state}
    end

    defp list_to_domain() do
        fn(truck) -> RelationalAdapter.Luxor.Truck.to_business(truck) end
    end
end
