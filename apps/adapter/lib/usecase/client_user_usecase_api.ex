defmodule Usecase.Luxor.ClientUserUsecaseApi do
    def save(command = %Command.ClientUser.SaveClientUserCommand{}) do
        GenServer.call(:save_client_user_usecase, {:save, command})
    end

    def update(command = %Command.ClientUser.UpdateClientUserCommand{}) do
        GenServer.call(:update_client_user_usecase, {:update, command})
    end
end