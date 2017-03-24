defmodule RelationalAdapter.Luxor.TransporterPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.TransporterPersistenceAdapter, state, opts)
    end

    def handle_call({:save, manager}, _from, actual_state) do
        manager |>
        RelationalAdapter.Luxor.Transporter.from_business |>
        RelationalAdapter.Luxor.TransporterRepository.save |>
        RelationalAdapter.Luxor.Transporter.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.TransporterRepository.get |>
        RelationalAdapter.Luxor.TransporterRepository.delete |>
        RelationalAdapter.Luxor.Transporter.to_business |>
        response(actual_state)
    end

    def handle_call({:update, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.TransporterRepository.get |>
        RelationalAdapter.Luxor.Transporter.change_state_to(manager) |>
        RelationalAdapter.Luxor.TransporterRepository.update |>
        RelationalAdapter.Luxor.Transporter.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.TransporterRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.TransporterRepository.get |>
        RelationalAdapter.Luxor.Transporter.to_business |>
        response(actual_state)
    end

    defp response(manager, actual_state) do
        {:reply, manager, actual_state}
    end

    defp list_to_domain() do
        fn(manager) -> RelationalAdapter.Luxor.Transporter.to_business(manager) end
    end
end
