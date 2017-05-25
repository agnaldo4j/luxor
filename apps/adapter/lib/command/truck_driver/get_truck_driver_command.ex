defmodule Command.TruckDriver.GetTruckDriverCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.TruckDriver.GetTruckDriverCommand {
        id: String.t
    }
end