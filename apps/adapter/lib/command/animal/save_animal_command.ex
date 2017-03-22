defmodule Command.Animal.SaveAnimalCommand do
    defstruct [
        :register_number,
        :breed,
        :producer
    ]

    @type t :: %Command.Animal.SaveAnimalCommand {
        register_number: String.t,
        breed: String.t,
        producer: Luxor.Producer.t
    }
end