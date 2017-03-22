defmodule Command.Device.UpdateDeviceCommand do

    defstruct [
        :id,
        :serial_number,
        :name
    ]

    @type t :: %Command.Device.UpdateDeviceCommand {
        id: String.t,
        serial_number: String.t,
        name: String.t
    }
end