defmodule Command.TruckDriver.SaveTruckDriverCommand do
    @moduledoc ""

    defstruct [
        :name
    ]

    @type t :: %Command.TruckDriver.SaveTruckDriverCommand {
        name: String.t
    }
end
