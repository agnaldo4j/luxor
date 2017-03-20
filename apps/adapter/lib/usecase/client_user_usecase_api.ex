defmodule Usecase.Luxor.ClientUserUsecaseApi do
    def save(command = %Command.ClientUser.SaveClientUserCommand{}) do
        GenServer.call(:save_client_user_usecase, {:save, command})
    end
end