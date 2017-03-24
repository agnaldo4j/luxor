defmodule Command.Farm.SaveFarmCommand do
    defstruct [
        :name
    ]

    @type t :: %Command.Farm.SaveFarmCommand {
        name: String.t
    }
end