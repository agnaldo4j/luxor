defmodule Usecase.Luxor.ClientUserUsecaseApi do
    def save(command = %Command.ClientUser.SaveClientUserCommand{}) do
        GenServer.call(:save_client_user_usecase, {:save, command})
    end

    def update(command = %Command.ClientUser.UpdateClientUserCommand{}) do
        GenServer.call(:update_client_user_usecase, {:update, command})
    end

    def delete(command = %Command.ClientUser.DeleteClientUserCommand{}) do
        GenServer.call(:delete_client_user_usecase, {:delete, command})
    end

    def list(command = %Command.ClientUser.ListClientUserCommand{}) do
        GenServer.call(:list_client_user_usecase, {:list, command})
    end

    def get(command = %Command.ClientUser.GetClientUserCommand{}) do
        GenServer.call(:get_client_user_usecase, {:get, command})
    end
end