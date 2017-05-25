defmodule Usecase.Luxor.GetManagerUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetManagerUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Manager.GetManagerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Manager.GetManagerCommand{}) do
        %Luxor.Manager{id: command.id} |>
        Persistence.Luxor.ManagerPersistenceAdapterApi.get
    end
end
