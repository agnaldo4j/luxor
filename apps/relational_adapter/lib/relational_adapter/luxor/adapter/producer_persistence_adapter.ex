defmodule RelationalAdapter.Luxor.ProducerPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.ProducerPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_producers, _from, actual_state) do
        result = RelationalAdapter.Luxor.ProducerRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_producer_by_id, producer_id}, _from, actual_state) do
        {:reply, %Luxor.Producer{id: producer_id}, actual_state}
    end

    def handle_call({:save_producer, producer}, _from, actual_state) do
        producer |>
        RelationalAdapter.Luxor.Producer.from_business |>
        RelationalAdapter.Luxor.ProducerRepository.save |>
        RelationalAdapter.Luxor.Producer.to_business |>
        save_producer_response(actual_state)
    end

    defp save_producer_response(producer, actual_state) do
        {:reply, producer, actual_state}
    end

    defp list_to_domain() do
        fn(producer) -> RelationalAdapter.Luxor.Producer.to_business(producer) end
    end
end
