defmodule Usecase.Luxor.SaveProducerUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveProducerUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Producer.SaveProducerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Producer.SaveProducerCommand{}) do
        %Luxor.Producer{name: command.name, sex: command.sex, cpf: command.cpf, phone: command.phone} |>
        Luxor.Producer.identify |>
        Persistence.Luxor.ProducerPersistenceAdapterApi.save
    end
end
