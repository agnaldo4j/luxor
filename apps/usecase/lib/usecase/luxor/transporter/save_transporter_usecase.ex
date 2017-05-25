defmodule Usecase.Luxor.SaveTransporterUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveTransporterUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Transporter.SaveTransporterCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Transporter.SaveTransporterCommand{}) do
        %Luxor.Transporter{name: command.name} |>
        Luxor.Transporter.identify |>
        Persistence.Luxor.TransporterPersistenceAdapterApi.save
    end
end
