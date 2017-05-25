defmodule Command.TruckDriver.UpdateTruckDriverCommand do
    @moduledoc ""


    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.TruckDriver.UpdateTruckDriverCommand {
        id: String.t,
        name: String.t
    }
end
