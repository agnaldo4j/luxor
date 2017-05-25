defmodule Command.Farm.UpdateFarmCommand do
    @moduledoc ""


    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.Farm.UpdateFarmCommand {
        id: String.t,
        name: String.t
    }
end
