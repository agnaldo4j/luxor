defmodule Usecase.Luxor.DeviceUsecaseApi do
    def add_new_device(command = %Command.Device.AddNewDeviceCommand{}) do
        GenServer.call(:add_device_usecase, {:add_new_device, command})
    end
end