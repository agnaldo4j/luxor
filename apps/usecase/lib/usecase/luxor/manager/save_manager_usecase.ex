defmodule Usecase.Luxor.SaveManagerUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveManagerUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Manager.SaveManagerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Manager.SaveManagerCommand{}) do
        %Luxor.Manager{name: command.name} |>
        Luxor.Manager.identify |>
        Persistence.Luxor.ManagerPersistenceAdapterApi.save
    end
end