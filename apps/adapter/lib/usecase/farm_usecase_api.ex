defmodule Usecase.Luxor.FarmUsecaseApi do
    def save(command = %Command.Farm.SaveFarmCommand{}) do
        GenServer.call(:save_farm_usecase, {:save, command}, 15000)
    end

    def delete(command = %Command.Farm.DeleteFarmCommand{}) do
        GenServer.call(:delete_farm_usecase, {:delete, command}, 15000)
    end

    def update(command = %Command.Farm.UpdateFarmCommand{}) do
        GenServer.call(:update_farm_usecase, {:update, command}, 15000)
    end

    def list(command = %Command.Farm.ListFarmCommand{}) do
        GenServer.call(:list_farm_usecase, {:list, command}, 15000)
    end

    def get(command = %Command.Farm.GetFarmCommand{}) do
        GenServer.call(:get_farm_usecase, {:get, command}, 15000)
    end
end