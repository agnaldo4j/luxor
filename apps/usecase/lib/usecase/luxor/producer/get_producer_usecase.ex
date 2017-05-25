defmodule Usecase.Luxor.GetProducerUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetProducerUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Producer.GetProducerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Producer.GetProducerCommand{}) do
        %Luxor.Producer{id: command.id} |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.get
    end
end