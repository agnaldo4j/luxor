defmodule Command.Device.DeleteDeviceCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Device.DeleteDeviceCommand {
        id: String.t
    }
end