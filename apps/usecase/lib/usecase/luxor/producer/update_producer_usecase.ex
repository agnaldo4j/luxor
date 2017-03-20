defmodule Usecase.Luxor.UpdateProducerUsecase do
    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateProducerUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Producer.UpdateProducerCommand{}}, _from, actual_state) do
        updated_producer_model = update_producer(command)
        {:reply, updated_producer_model, actual_state}
    end

    defp update_producer(command = %Command.Producer.UpdateProducerCommand{}) do
        %Luxor.Producer{
            id: command.id,
            name: command.name,
            sex: command.sex,
            cpf: command.cpf,
            phone: command.phone
        } |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.update
    end
end