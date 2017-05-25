defmodule Usecase.Luxor.ClientUserUsecaseApi do
    @moduledoc ""

    def save(command = %Command.ClientUser.SaveClientUserCommand{}) do
        GenServer.call(:save_client_user_usecase, {:save, command}, 15_000)
    end

    def update(command = %Command.ClientUser.UpdateClientUserCommand{}) do
        GenServer.call(:update_client_user_usecase, {:update, command}, 15_000)
    end

    def delete(command = %Command.ClientUser.DeleteClientUserCommand{}) do
        GenServer.call(:delete_client_user_usecase, {:delete, command}, 15_000)
    end

    def list(command = %Command.ClientUser.ListClientUserCommand{}) do
        GenServer.call(:list_client_user_usecase, {:list, command}, 15_000)
    end

    def get(command = %Command.ClientUser.GetClientUserCommand{}) do
        GenServer.call(:get_client_user_usecase, {:get, command}, 15_000)
    end
end
