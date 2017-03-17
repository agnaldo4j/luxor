defmodule RelationalAdapter.Luxor.ManagerPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.ManagerPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_managers, _from, actual_state) do
        result = RelationalAdapter.Luxor.ManagerRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_manager_by_id, manager_id}, _from, actual_state) do
        {:reply, %Luxor.Manager{id: manager_id}, actual_state}
    end

    def handle_call({:save_manager, manager}, _from, actual_state) do
        manager |>
        RelationalAdapter.Luxor.Manager.from_business |>
        RelationalAdapter.Luxor.ManagerRepository.save |>
        RelationalAdapter.Luxor.Manager.to_business |>
        save_manager_response(actual_state)
    end

    defp save_manager_response(manager, actual_state) do
        {:reply, manager, actual_state}
    end

    defp list_to_domain() do
        fn(manager) -> RelationalAdapter.Luxor.Manager.to_business(manager) end
    end
end
