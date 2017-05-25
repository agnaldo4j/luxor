defmodule Command.Device.SaveDeviceCommand do
    @moduledoc ""

    defstruct [
        :serial_number,
        :name
    ]

    @type t :: %Command.Device.SaveDeviceCommand {
        serial_number: String.t,
        name: String.t
    }
end