defmodule Command.Animal.DeleteAnimalCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Animal.DeleteAnimalCommand {
        id: String.t
    }
end