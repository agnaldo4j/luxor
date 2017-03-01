defmodule Command.Device.AddNewDeviceCommand do
    defstruct [
        :serial_number,
        :name
    ]

    @type t :: %Command.Device.AddNewDeviceCommand {
        serial_number: String.t,
        name: String.t
    }
end