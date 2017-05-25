defmodule Command.Truck.UpdateTruckCommand do
    @moduledoc ""


    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.Truck.UpdateTruckCommand {
        id: String.t,
        name: String.t
    }
end
