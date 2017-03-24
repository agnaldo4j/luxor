defmodule Usecase.Luxor.GetTransporterUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetTransporterUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Transporter.GetTransporterCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Transporter.GetTransporterCommand{}) do
        %Luxor.Transporter{id: command.id} |>
        Persistence.Luxor.TransporterPersistenceAdapterApi.get
    end
end