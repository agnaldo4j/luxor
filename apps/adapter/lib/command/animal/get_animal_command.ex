defmodule Command.Animal.GetAnimalCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Animal.GetAnimalCommand {
        id: String.t
    }
end