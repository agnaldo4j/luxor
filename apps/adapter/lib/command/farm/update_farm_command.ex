defmodule Command.Farm.UpdateFarmCommand do

    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.Farm.UpdateFarmCommand {
        id: String.t,
        name: String.t
    }
end