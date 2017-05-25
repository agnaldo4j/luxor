defmodule RelationalAdapter.Luxor.ProducerPersistenceAdapter do
    @moduledoc ""

    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.ProducerPersistenceAdapter, state, opts)
    end

    def handle_call({:save, producer}, _from, actual_state) do
        producer |>
        RelationalAdapter.Luxor.Producer.from_business |>
        RelationalAdapter.Luxor.ProducerRepository.save |>
        RelationalAdapter.Luxor.Producer.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, producer}, _from, actual_state) do
        producer.id |>
        RelationalAdapter.Luxor.ProducerRepository.get |>
        RelationalAdapter.Luxor.ProducerRepository.delete |>
        RelationalAdapter.Luxor.Producer.to_business |>
        response(actual_state)
    end

    def handle_call({:update, producer}, _from, actual_state) do
        producer.id |>
        RelationalAdapter.Luxor.ProducerRepository.get |>
        RelationalAdapter.Luxor.Producer.change_state_to(producer) |>
        RelationalAdapter.Luxor.ProducerRepository.update |>
        RelationalAdapter.Luxor.Producer.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.ProducerRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, producer}, _from, actual_state) do
        producer.id |>
        RelationalAdapter.Luxor.ProducerRepository.get |>
        RelationalAdapter.Luxor.Producer.to_business |>
        response(actual_state)
    end

    defp response(producer, actual_state) do
        {:reply, producer, actual_state}
    end

    defp list_to_domain() do
        fn(producer) -> RelationalAdapter.Luxor.Producer.to_business(producer) end
    end
end
