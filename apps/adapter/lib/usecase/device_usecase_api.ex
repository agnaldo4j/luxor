defmodule Usecase.Luxor.DeviceUsecaseApi do
    @moduledoc ""

    def save(command = %Command.Device.SaveDeviceCommand{}) do
        GenServer.call(:save_device_usecase, {:save, command}, 15_000)
    end

    def delete(command = %Command.Device.DeleteDeviceCommand{}) do
        GenServer.call(:delete_device_usecase, {:delete, command}, 15_000)
    end

    def update(command = %Command.Device.UpdateDeviceCommand{}) do
        GenServer.call(:update_device_usecase, {:update, command}, 15_000)
    end

    def list(command = %Command.Device.ListDeviceCommand{}) do
        GenServer.call(:list_device_usecase, {:list, command}, 15_000)
    end

    def get(command = %Command.Device.GetDeviceCommand{}) do
        GenServer.call(:get_device_usecase, {:get, command}, 15_000)
    end
end