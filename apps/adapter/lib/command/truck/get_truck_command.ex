defmodule Command.Truck.GetTruckCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Truck.GetTruckCommand {
        id: String.t
    }
end