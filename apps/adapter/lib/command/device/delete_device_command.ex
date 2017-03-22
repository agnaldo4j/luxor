defmodule Command.Device.DeleteDeviceCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Device.DeleteDeviceCommand {
        id: String.t
    }
end