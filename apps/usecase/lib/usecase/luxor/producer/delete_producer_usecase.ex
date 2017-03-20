defmodule Usecase.Luxor.DeleteProducerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteProducerUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Producer.DeleteProducerCommand{}}, _from, actual_state) do
        removed_producer_model = remove_producer(command)
        {:reply, removed_producer_model, actual_state}
    end

    defp remove_producer(command = %Command.Producer.DeleteProducerCommand{}) do
        %Luxor.Producer{id: command.id} |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.delete
    end
end