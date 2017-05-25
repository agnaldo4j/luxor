defmodule RelationalAdapter.Luxor.ManagerPersistenceAdapter do
    @moduledoc ""

    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.ManagerPersistenceAdapter, state, opts)
    end

    def handle_call({:save, manager}, _from, actual_state) do
        manager |>
        RelationalAdapter.Luxor.Manager.from_business |>
        RelationalAdapter.Luxor.ManagerRepository.save |>
        RelationalAdapter.Luxor.Manager.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.ManagerRepository.get |>
        RelationalAdapter.Luxor.ManagerRepository.delete |>
        RelationalAdapter.Luxor.Manager.to_business |>
        response(actual_state)
    end

    def handle_call({:update, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.ManagerRepository.get |>
        RelationalAdapter.Luxor.Manager.change_state_to(manager) |>
        RelationalAdapter.Luxor.ManagerRepository.update |>
        RelationalAdapter.Luxor.Manager.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.ManagerRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.ManagerRepository.get |>
        RelationalAdapter.Luxor.Manager.to_business |>
        response(actual_state)
    end

    defp response(manager, actual_state) do
        {:reply, manager, actual_state}
    end

    defp list_to_domain() do
        fn(manager) -> RelationalAdapter.Luxor.Manager.to_business(manager) end
    end
end
