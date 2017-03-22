defmodule Usecase.Luxor.SaveAnimalUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveAnimalUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Animal.SaveAnimalCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Animal.SaveAnimalCommand{}) do
        %Luxor.Animal{register_number: command.register_number, breed: command.breed, producer: command.producer} |>
        Luxor.Animal.identify |>
        Persistence.Luxor.AnimalPersistenceAdapterApi.save
    end
end