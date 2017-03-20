defmodule Usecase.Luxor.SaveProducerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveProducerUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Producer.SaveProducerCommand{}}, _from, actual_state) do
        saved_producer_model = add_new_producer(command)
        {:reply, saved_producer_model, actual_state}
    end

    defp add_new_producer(command = %Command.Producer.SaveProducerCommand{}) do
        %Luxor.Producer{name: command.name, sex: command.sex, cpf: command.cpf, phone: command.phone} |>
        Luxor.Producer.identify |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.save
    end
end