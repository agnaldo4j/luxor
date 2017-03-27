defmodule Command.TruckDriver.SaveTruckDriverCommand do
    defstruct [
        :name
    ]

    @type t :: %Command.TruckDriver.SaveTruckDriverCommand {
        name: String.t
    }
end