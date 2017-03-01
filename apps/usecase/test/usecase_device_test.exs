defmodule Usecase.DeviceTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.AddDeviceUsecase

    test "add new device by persistence adapter" do
        command = %Command.Device.AddNewDeviceCommand{serial_number: "aaabbbcccc1234", name: "teste"}
        result = Usecase.Luxor.AddDeviceUsecaseApi.add_new_device(command)
        IO.inspect result
        assert result.serial_number == "aaabbbcccc1234"
    end
end
