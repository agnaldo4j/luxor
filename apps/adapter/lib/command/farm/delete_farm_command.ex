defmodule Command.Farm.DeleteFarmCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Farm.DeleteFarmCommand {
        id: String.t
    }
end