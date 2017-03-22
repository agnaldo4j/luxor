defmodule Command.Animal.DeleteAnimalCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Animal.DeleteAnimalCommand {
        id: String.t
    }
end