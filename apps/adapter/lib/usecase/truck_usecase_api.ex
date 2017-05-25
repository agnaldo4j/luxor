defmodule Usecase.Luxor.TruckUsecaseApi do
    @moduledoc ""

    def save(command = %Command.Truck.SaveTruckCommand{}) do
        GenServer.call(:save_truck_usecase, {:save, command}, 15_000)
    end

    def delete(command = %Command.Truck.DeleteTruckCommand{}) do
        GenServer.call(:delete_truck_usecase, {:delete, command}, 15_000)
    end

    def update(command = %Command.Truck.UpdateTruckCommand{}) do
        GenServer.call(:update_truck_usecase, {:update, command}, 15_000)
    end

    def list(command = %Command.Truck.ListTruckCommand{}) do
        GenServer.call(:list_truck_usecase, {:list, command}, 15_000)
    end

    def get(command = %Command.Truck.GetTruckCommand{}) do
        GenServer.call(:get_truck_usecase, {:get, command}, 15_000)
    end
end
