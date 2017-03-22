defmodule Command.Device.SaveDeviceCommand do
    defstruct [
        :serial_number,
        :name
    ]

    @type t :: %Command.Device.SaveDeviceCommand {
        serial_number: String.t,
        name: String.t
    }
end