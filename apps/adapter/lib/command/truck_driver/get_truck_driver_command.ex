defmodule Command.TruckDriver.GetTruckDriverCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.TruckDriver.GetTruckDriverCommand {
        id: String.t
    }
end