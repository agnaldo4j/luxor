defmodule Command.Truck.GetTruckCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Truck.GetTruckCommand {
        id: String.t
    }
end