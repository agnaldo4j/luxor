defmodule Command.Animal.UpdateAnimalCommand do

    defstruct [
        :id,
        :register_number,
        :breed,
        :producer
    ]

    @type t :: %Command.Animal.UpdateAnimalCommand {
        id: String.t,
        register_number: String.t,
        breed: String.t,
        producer: Luxor.Producer.t
    }
end