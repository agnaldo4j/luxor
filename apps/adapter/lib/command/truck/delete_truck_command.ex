defmodule Command.Truck.DeleteTruckCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Truck.DeleteTruckCommand {
        id: String.t
    }
end
