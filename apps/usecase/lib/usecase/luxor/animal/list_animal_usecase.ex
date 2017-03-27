defmodule Usecase.Luxor.ListAnimalUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListAnimalUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Animal.ListAnimalCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.Animal.ListAnimalCommand{}) do
        Persistence.Luxor.AnimalPersistenceAdapterApi.list
    end
end