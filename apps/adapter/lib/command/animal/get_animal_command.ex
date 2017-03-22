defmodule Command.Animal.GetAnimalCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Animal.GetAnimalCommand {
        id: String.t
    }
end