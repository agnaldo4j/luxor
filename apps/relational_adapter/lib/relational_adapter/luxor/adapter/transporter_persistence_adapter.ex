defmodule RelationalAdapter.Luxor.TransporterPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.TransporterPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_transporters, _from, actual_state) do
        result = RelationalAdapter.Luxor.TransporterRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_transporter_by_id, transporter_id}, _from, actual_state) do
        {:reply, %Luxor.Transporter{id: transporter_id}, actual_state}
    end

    def handle_call({:save_transporter, transporter}, _from, actual_state) do
        transporter |>
        RelationalAdapter.Luxor.Transporter.from_business |>
        RelationalAdapter.Luxor.TransporterRepository.save |>
        RelationalAdapter.Luxor.Transporter.to_business |>
        save_transporter_response(actual_state)
    end

    defp save_transporter_response(transporter, actual_state) do
        {:reply, transporter, actual_state}
    end

    defp list_to_domain() do
        fn(transporter) -> RelationalAdapter.Luxor.Transporter.to_business(transporter) end
    end
end
