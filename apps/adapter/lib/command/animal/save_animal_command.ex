defmodule Command.Animal.SaveAnimalCommand do
    @moduledoc ""

    defstruct [
        :register_number,
        :breed,
        :producer_id
    ]

    @type t :: %Command.Animal.SaveAnimalCommand {
        register_number: String.t,
        breed: String.t,
        producer_id: Integer.t
    }
end
