defmodule RelationalAdapter.Luxor.FarmPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.FarmPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_farms, _from, actual_state) do
        result = RelationalAdapter.Luxor.FarmRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_farm_by_id, farm_id}, _from, actual_state) do
        {:reply, %Luxor.Farm{id: farm_id}, actual_state}
    end

    def handle_call({:save_farm, farm}, _from, actual_state) do
        farm |>
        RelationalAdapter.Luxor.Farm.from_business |>
        RelationalAdapter.Luxor.FarmRepository.save |>
        RelationalAdapter.Luxor.Farm.to_business |>
        save_farm_response(actual_state)
    end

    defp save_farm_response(farm, actual_state) do
        {:reply, farm, actual_state}
    end

    defp list_to_domain() do
        fn(farm) -> RelationalAdapter.Luxor.Farm.to_business(farm) end
    end
end
