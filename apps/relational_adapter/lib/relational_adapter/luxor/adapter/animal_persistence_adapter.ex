defmodule RelationalAdapter.Luxor.AnimalPersistenceAdapter do
    @moduledoc ""

    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.AnimalPersistenceAdapter, state, opts)
    end

    def handle_call({:save, animal}, _from, actual_state) do
        animal |>
        RelationalAdapter.Luxor.Animal.from_business |>
        RelationalAdapter.Luxor.AnimalRepository.save |>
        RelationalAdapter.Luxor.Animal.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, animal}, _from, actual_state) do
        animal.id |>
        RelationalAdapter.Luxor.AnimalRepository.get |>
        RelationalAdapter.Luxor.AnimalRepository.delete |>
        RelationalAdapter.Luxor.Animal.to_business |>
        response(actual_state)
    end

    def handle_call({:update, animal}, _from, actual_state) do
        animal.id |>
        RelationalAdapter.Luxor.AnimalRepository.get |>
        RelationalAdapter.Luxor.Animal.change_state_to(animal) |>
        RelationalAdapter.Luxor.AnimalRepository.update |>
        RelationalAdapter.Luxor.Animal.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.AnimalRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, animal}, _from, actual_state) do
        animal.id |>
        RelationalAdapter.Luxor.AnimalRepository.get |>
        RelationalAdapter.Luxor.Animal.to_business |>
        response(actual_state)
    end

    defp response(animal, actual_state) do
        {:reply, animal, actual_state}
    end

    defp list_to_domain() do
        fn(animal) -> RelationalAdapter.Luxor.Animal.to_business(animal) end
    end
end
