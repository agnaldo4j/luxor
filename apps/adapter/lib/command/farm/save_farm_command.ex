defmodule Command.Farm.SaveFarmCommand do
    @moduledoc ""

    defstruct [
        :name
    ]

    @type t :: %Command.Farm.SaveFarmCommand {
        name: String.t
    }
end