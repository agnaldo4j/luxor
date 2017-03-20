defmodule Usecase.Luxor.AddProducerUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.AddProducerUsecase, state, opts)
    end

    def handle_call({:add_new_producer, command = %Command.Producer.AddNewProducerCommand{}}, _from, actual_state) do
        saved_producer_model = add_new_producer(command)
        {:reply, saved_producer_model, actual_state}
    end

    defp add_new_producer(command = %Command.Producer.AddNewProducerCommand{}) do
        %Luxor.Producer{name: command.name, sex: command.sex, cpf: command.cpf, phone: command.phone} |>
        Luxor.Producer.identify |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.save
    end
end