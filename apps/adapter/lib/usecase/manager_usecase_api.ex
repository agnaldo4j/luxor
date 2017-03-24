defmodule Usecase.Luxor.ManagerUsecaseApi do
    def save(command = %Command.Manager.SaveManagerCommand{}) do
        GenServer.call(:save_manager_usecase, {:save, command}, 15000)
    end

    def delete(command = %Command.Manager.DeleteManagerCommand{}) do
        GenServer.call(:delete_manager_usecase, {:delete, command}, 15000)
    end

    def update(command = %Command.Manager.UpdateManagerCommand{}) do
        GenServer.call(:update_manager_usecase, {:update, command}, 15000)
    end

    def list(command = %Command.Manager.ListManagerCommand{}) do
        GenServer.call(:list_manager_usecase, {:list, command}, 15000)
    end

    def get(command = %Command.Manager.GetManagerCommand{}) do
        GenServer.call(:get_manager_usecase, {:get, command}, 15000)
    end
end