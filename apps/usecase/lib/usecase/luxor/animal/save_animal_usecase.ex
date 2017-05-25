defmodule Usecase.Luxor.SaveAnimalUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveAnimalUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Animal.SaveAnimalCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Animal.SaveAnimalCommand{}) do
        command.producer_id
        |> get_producer
        |> build_animal_with(command)
        |> Luxor.Animal.identify
        |> Persistence.Luxor.AnimalPersistenceAdapterApi.save

    end

    defp get_producer(producer_id) do
        %Luxor.Producer{id: producer_id} |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.get
    end

    defp build_animal_with(producer, command) do
      %Luxor.Animal{
        register_number: command.register_number,
        breed: command.breed,
        producer: producer
      }
    end
end
