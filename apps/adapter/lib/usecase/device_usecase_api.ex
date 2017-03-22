defmodule Usecase.Luxor.DeviceUsecaseApi do
    def save(command = %Command.Device.SaveDeviceCommand{}) do
        GenServer.call(:save_device_usecase, {:save, command})
    end

    def delete(command = %Command.Device.DeleteDeviceCommand{}) do
        GenServer.call(:delete_device_usecase, {:delete, command})
    end

    def update(command = %Command.Device.UpdateDeviceCommand{}) do
        GenServer.call(:update_device_usecase, {:update, command})
    end

    def list(command = %Command.Device.ListDeviceCommand{}) do
        GenServer.call(:list_device_usecase, {:list, command})
    end

    def get(command = %Command.Device.GetDeviceCommand{}) do
        GenServer.call(:get_device_usecase, {:get, command})
    end
end