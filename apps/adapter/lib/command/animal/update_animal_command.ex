defmodule Command.Animal.UpdateAnimalCommand do

    defstruct [
        :id,
        :register_number,
        :breed,
        :producer_id
    ]

    @type t :: %Command.Animal.UpdateAnimalCommand {
        id: String.t,
        register_number: String.t,
        breed: String.t,
        producer_id: Integer.t
    }
end