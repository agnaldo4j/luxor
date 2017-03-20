defmodule Usecase.Luxor.ProducerUsecaseApi do
    def add_new_producer(command = %Command.Producer.AddNewProducerCommand{}) do
        GenServer.call(:add_producer_usecase, {:add_new_producer, command})
    end
end