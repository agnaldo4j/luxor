defmodule Command.TruckDriver.DeleteTruckDriverCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.TruckDriver.DeleteTruckDriverCommand {
        id: String.t
    }
end