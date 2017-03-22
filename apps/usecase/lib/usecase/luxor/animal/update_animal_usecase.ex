defmodule Usecase.Luxor.UpdateAnimalUsecase do
    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateAnimalUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Animal.UpdateAnimalCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Animal.UpdateAnimalCommand{}) do
        get_producer(command.producer_id) |>
        build_animal_with(command) |>
        Persistence.Luxor.AnimalPersistenceAdapterApi.update
    end

    defp get_producer(producer_id) do
        %Luxor.Producer{id: producer_id} |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.get
    end

    defp build_animal_with(producer, command) do
      %Luxor.Animal{
        id: command.id,
        register_number: command.register_number,
        breed: command.breed,
        producer: producer
      }
    end
end