defmodule Usecase.DeviceTest do
  use ExUnit.Case, async: true
  doctest Usecase.Luxor.SaveDeviceUsecase
  doctest Usecase.Luxor.UpdateDeviceUsecase
  doctest Usecase.Luxor.DeleteDeviceUsecase
  doctest Usecase.Luxor.ListDeviceUsecase
  doctest Usecase.Luxor.GetDeviceUsecase

    @tag :DeviceTest
    test "add new device by persistence adapter" do
        result = Usecase.Luxor.DeviceUsecaseApi.save(
            %Command.Device.SaveDeviceCommand{
                serial_number: "1234567890",
                name: "teste"
            }
        )
        assert result.name == "teste"
    end

    @tag :DeviceTest
    test "update device by persistence adapter" do
        saved_device = Usecase.Luxor.DeviceUsecaseApi.save(
            %Command.Device.SaveDeviceCommand{
                serial_number: "1234567890",
                name: "teste"
            }
        )

        result = Usecase.Luxor.DeviceUsecaseApi.update(
            %Command.Device.UpdateDeviceCommand{
                id: saved_device.id,
                serial_number: "0987654321",
                name: "teste2"
            }
        )
        assert result.name == "teste2"
    end

    @tag :DeviceTest
    test "remove device by persistence adapter" do
        saved_device = Usecase.Luxor.DeviceUsecaseApi.save(
            %Command.Device.SaveDeviceCommand{
                serial_number: "1234567890",
                name: "teste"
            }
        )

        result = Usecase.Luxor.DeviceUsecaseApi.delete(
            %Command.Device.DeleteDeviceCommand{
                id: saved_device.id
            }
        )
        assert result.name == "teste"
    end

    @tag :DeviceTest
    test "list device by persistence adapter" do
        Usecase.Luxor.DeviceUsecaseApi.save(
            %Command.Device.SaveDeviceCommand{
                serial_number: "1234567890",
                name: "teste"
            }
        )

        result = Usecase.Luxor.DeviceUsecaseApi.list(
            %Command.Device.ListDeviceCommand{}
        )
        assert Enum.empty?(result) == false
    end

    @tag :DeviceTest
    test "get device by persistence adapter" do
        saved_device = Usecase.Luxor.DeviceUsecaseApi.save(
            %Command.Device.SaveDeviceCommand{
                serial_number: "1234567890",
                name: "teste"
            }
        )

        result = Usecase.Luxor.DeviceUsecaseApi.get(
            %Command.Device.GetDeviceCommand{
                id: saved_device.id
            }
        )
        assert result.name == "teste"
    end
end
