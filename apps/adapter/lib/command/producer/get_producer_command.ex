defmodule Command.Producer.GetProducerCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Producer.GetProducerCommand {
        id: String.t
    }
end