defmodule Usecase.DeviceTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.AddDeviceUsecase

    test "add new device by persistence adapter" do
        command = %Command.Device.AddNewDeviceCommand{serial_number: "aaabbbcccc1234", name: "teste"}
        result = Usecase.Luxor.DeviceUsecaseApi.add_new_device(command)
        assert result.serial_number == "aaabbbcccc1234"
    end
end
