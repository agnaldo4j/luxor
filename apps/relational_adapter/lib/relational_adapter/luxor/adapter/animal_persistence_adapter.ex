defmodule RelationalAdapter.Luxor.AnimalPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.AnimalPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_animals, _from, actual_state) do
        result = RelationalAdapter.Luxor.AnimalRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_animal_by_id, animal_id}, _from, actual_state) do
        {:reply, %Luxor.Animal{id: animal_id}, actual_state}
    end

    def handle_call({:save_animal, animal}, _from, actual_state) do
        animal |>
        RelationalAdapter.Luxor.Animal.from_business |>
        RelationalAdapter.Luxor.AnimalRepository.save |>
        RelationalAdapter.Luxor.Animal.to_business |>
        save_animal_response(actual_state)
    end

    defp save_animal_response(animal, actual_state) do
        {:reply, animal, actual_state}
    end

    defp list_to_domain() do
        fn(animal) -> RelationalAdapter.Luxor.Animal.to_business(animal) end
    end
end
