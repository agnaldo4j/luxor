defmodule Command.Truck.DeleteTruckCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Truck.DeleteTruckCommand {
        id: String.t
    }
end