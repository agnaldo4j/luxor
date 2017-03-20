defmodule Usecase.Luxor.ListProducerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListProducerUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Producer.ListProducerCommand{}}, _from, actual_state) do
        list_producers_model = list_producers(command)
        {:reply, list_producers_model, actual_state}
    end

    defp list_producers(command = %Command.Producer.ListProducerCommand{}) do
        Persistence.Luxor.ProducerPersistenceAdapterApi.list
    end
end