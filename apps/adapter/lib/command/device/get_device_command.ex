defmodule Command.Device.GetDeviceCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Device.GetDeviceCommand {
        id: String.t
    }
end