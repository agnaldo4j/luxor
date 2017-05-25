defmodule Usecase.Luxor.UpdateTransporterUsecase do
    @moduledoc ""

    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateTransporterUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Transporter.UpdateTransporterCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Transporter.UpdateTransporterCommand{}) do
        %Luxor.Transporter{
            id: command.id,
            name: command.name
        } |>
        Persistence.Luxor.TransporterPersistenceAdapterApi.update
    end
end
