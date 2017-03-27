defmodule Command.TruckDriver.UpdateTruckDriverCommand do

    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.TruckDriver.UpdateTruckDriverCommand {
        id: String.t,
        name: String.t
    }
end