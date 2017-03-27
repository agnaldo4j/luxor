defmodule Usecase.Luxor.TruckDriverUsecaseApi do
    def save(command = %Command.TruckDriver.SaveTruckDriverCommand{}) do
        GenServer.call(:save_truck_driver_usecase, {:save, command}, 15000)
    end

    def delete(command = %Command.TruckDriver.DeleteTruckDriverCommand{}) do
        GenServer.call(:delete_truck_driver_usecase, {:delete, command}, 15000)
    end

    def update(command = %Command.TruckDriver.UpdateTruckDriverCommand{}) do
        GenServer.call(:update_truck_driver_usecase, {:update, command}, 15000)
    end

    def list(command = %Command.TruckDriver.ListTruckDriverCommand{}) do
        GenServer.call(:list_truck_driver_usecase, {:list, command}, 15000)
    end

    def get(command = %Command.TruckDriver.GetTruckDriverCommand{}) do
        GenServer.call(:get_truck_driver_usecase, {:get, command}, 15000)
    end
end