defmodule Usecase.Luxor.DeleteTransporterUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteTransporterUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Transporter.DeleteTransporterCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Transporter.DeleteTransporterCommand{}) do
        %Luxor.Transporter{id: command.id} |>
        Persistence.Luxor.TransporterPersistenceAdapterApi.delete
    end
end