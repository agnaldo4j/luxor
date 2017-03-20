defmodule Usecase.Luxor.GetProducerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetProducerUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Producer.GetProducerCommand{}}, _from, actual_state) do
        get_producer_model = get_producer(command)
        {:reply, get_producer_model, actual_state}
    end

    defp get_producer(command = %Command.Producer.GetProducerCommand{}) do
        %Luxor.Producer{id: command.id} |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.get
    end
end