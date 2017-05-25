defmodule Usecase.Luxor.ListTransporterUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListTransporterUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Transporter.ListTransporterCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.Transporter.ListTransporterCommand{}) do
        Persistence.Luxor.TransporterPersistenceAdapterApi.list
    end
end