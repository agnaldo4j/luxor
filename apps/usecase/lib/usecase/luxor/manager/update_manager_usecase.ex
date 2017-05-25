defmodule Usecase.Luxor.UpdateManagerUsecase do
    @moduledoc ""

    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateManagerUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Manager.UpdateManagerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Manager.UpdateManagerCommand{}) do
        %Luxor.Manager{
            id: command.id,
            name: command.name
        } |>
        Persistence.Luxor.ManagerPersistenceAdapterApi.update
    end
end