defmodule RelationalAdapter.Luxor.FarmPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.FarmPersistenceAdapter, state, opts)
    end

    def handle_call({:save, farm}, _from, actual_state) do
        farm |>
        RelationalAdapter.Luxor.Farm.from_business |>
        RelationalAdapter.Luxor.FarmRepository.save |>
        RelationalAdapter.Luxor.Farm.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, farm}, _from, actual_state) do
        farm.id |>
        RelationalAdapter.Luxor.FarmRepository.get |>
        RelationalAdapter.Luxor.FarmRepository.delete |>
        RelationalAdapter.Luxor.Farm.to_business |>
        response(actual_state)
    end

    def handle_call({:update, farm}, _from, actual_state) do
        farm.id |>
        RelationalAdapter.Luxor.FarmRepository.get |>
        RelationalAdapter.Luxor.Farm.change_state_to(farm) |>
        RelationalAdapter.Luxor.FarmRepository.update |>
        RelationalAdapter.Luxor.Farm.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.FarmRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, farm}, _from, actual_state) do
        farm.id |>
        RelationalAdapter.Luxor.FarmRepository.get |>
        RelationalAdapter.Luxor.Farm.to_business |>
        response(actual_state)
    end

    defp response(farm, actual_state) do
        {:reply, farm, actual_state}
    end

    defp list_to_domain() do
        fn(farm) -> RelationalAdapter.Luxor.Farm.to_business(farm) end
    end
end
