defmodule Command.Farm.GetFarmCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Farm.GetFarmCommand {
        id: String.t
    }
end
