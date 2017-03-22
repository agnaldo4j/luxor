defmodule Usecase.Luxor.DeleteAnimalUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteAnimalUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Animal.DeleteAnimalCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Animal.DeleteAnimalCommand{}) do
        %Luxor.Animal{id: command.id} |>
        Persistence.Luxor.AnimalPersistenceAdapterApi.delete
    end
end