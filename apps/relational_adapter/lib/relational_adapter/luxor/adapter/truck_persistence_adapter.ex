defmodule RelationalAdapter.Luxor.TruckPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.TruckPersistenceAdapter, state, opts)
    end

    def handle_call({:save, manager}, _from, actual_state) do
        manager |>
        RelationalAdapter.Luxor.Truck.from_business |>
        RelationalAdapter.Luxor.TruckRepository.save |>
        RelationalAdapter.Luxor.Truck.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.TruckRepository.get |>
        RelationalAdapter.Luxor.TruckRepository.delete |>
        RelationalAdapter.Luxor.Truck.to_business |>
        response(actual_state)
    end

    def handle_call({:update, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.TruckRepository.get |>
        RelationalAdapter.Luxor.Truck.change_state_to(manager) |>
        RelationalAdapter.Luxor.TruckRepository.update |>
        RelationalAdapter.Luxor.Truck.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.TruckRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.TruckRepository.get |>
        RelationalAdapter.Luxor.Truck.to_business |>
        response(actual_state)
    end

    defp response(manager, actual_state) do
        {:reply, manager, actual_state}
    end

    defp list_to_domain() do
        fn(manager) -> RelationalAdapter.Luxor.Truck.to_business(manager) end
    end
end
