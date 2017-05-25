defmodule Usecase.Luxor.UpdateProducerUsecase do
    @moduledoc ""

    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateProducerUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Producer.UpdateProducerCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Producer.UpdateProducerCommand{}) do
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