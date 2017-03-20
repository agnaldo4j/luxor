defmodule Usecase.Luxor.ProducerUsecaseApi do
    def save(command = %Command.Producer.SaveProducerCommand{}) do
        GenServer.call(:save_producer_usecase, {:save, command})
    end

    def delete(command = %Command.Producer.DeleteProducerCommand{}) do
        GenServer.call(:delete_producer_usecase, {:delete, command})
    end

    def update(command = %Command.Producer.UpdateProducerCommand{}) do
        GenServer.call(:update_producer_usecase, {:update, command})
    end

    def list(command = %Command.Producer.ListProducerCommand{}) do
        GenServer.call(:list_producer_usecase, {:list, command})
    end
end