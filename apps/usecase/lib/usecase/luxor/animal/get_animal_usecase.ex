defmodule Usecase.Luxor.GetAnimalUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetAnimalUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Animal.GetAnimalCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Animal.GetAnimalCommand{}) do
        %Luxor.Animal{id: command.id} |>
        Persistence.Luxor.AnimalPersistenceAdapterApi.get
    end
end
