defmodule Command.Farm.GetFarmCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Farm.GetFarmCommand {
        id: String.t
    }
end