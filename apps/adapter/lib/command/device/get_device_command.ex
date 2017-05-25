defmodule Command.Device.GetDeviceCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Device.GetDeviceCommand {
        id: String.t
    }
end
