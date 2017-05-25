defmodule Command.TruckDriver.DeleteTruckDriverCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.TruckDriver.DeleteTruckDriverCommand {
        id: String.t
    }
end
