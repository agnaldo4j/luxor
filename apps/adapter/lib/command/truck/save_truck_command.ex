defmodule Command.Truck.SaveTruckCommand do
    @moduledoc ""

    defstruct [
        :name
    ]

    @type t :: %Command.Truck.SaveTruckCommand {
        name: String.t
    }
end