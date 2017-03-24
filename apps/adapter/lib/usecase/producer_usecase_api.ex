defmodule Usecase.Luxor.ProducerUsecaseApi do
    def save(command = %Command.Producer.SaveProducerCommand{}) do
        GenServer.call(:save_producer_usecase, {:save, command}, 15000)
    end

    def delete(command = %Command.Producer.DeleteProducerCommand{}) do
        GenServer.call(:delete_producer_usecase, {:delete, command}, 15000)
    end

    def update(command = %Command.Producer.UpdateProducerCommand{}) do
        GenServer.call(:update_producer_usecase, {:update, command}, 15000)
    end

    def list(command = %Command.Producer.ListProducerCommand{}) do
        GenServer.call(:list_producer_usecase, {:list, command}, 15000)
    end

    def get(command = %Command.Producer.GetProducerCommand{}) do
        GenServer.call(:get_producer_usecase, {:get, command}, 15000)
    end
end