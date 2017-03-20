defmodule Usecase.Luxor.ListProducerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListProducerUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Producer.ListProducerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Producer.ListProducerCommand{}) do
        Persistence.Luxor.ProducerPersistenceAdapterApi.list
    end
end