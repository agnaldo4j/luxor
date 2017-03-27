defmodule Command.Truck.SaveTruckCommand do
    defstruct [
        :name
    ]

    @type t :: %Command.Truck.SaveTruckCommand {
        name: String.t
    }
end