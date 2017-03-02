defmodule Usecase.Luxor.ClientUsecaseApi do
    def add_new_client(command = %Command.Client.AddNewClientCommand{}) do
        GenServer.call(:add_client_usecase, {:add_new_client, command})
    end
end