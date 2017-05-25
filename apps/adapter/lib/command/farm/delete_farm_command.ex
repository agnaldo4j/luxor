defmodule Command.Farm.DeleteFarmCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Farm.DeleteFarmCommand {
        id: String.t
    }
end