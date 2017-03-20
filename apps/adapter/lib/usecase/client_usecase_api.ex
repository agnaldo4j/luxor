defmodule Usecase.Luxor.ClientUsecaseApi do
    def save(command = %Command.Client.SaveClientCommand{}) do
        GenServer.call(:save_client_usecase, {:save, command})
    end
end