defmodule Command.Device.UpdateDeviceCommand do
    @moduledoc ""


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