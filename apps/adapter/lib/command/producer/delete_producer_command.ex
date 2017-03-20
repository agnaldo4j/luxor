defmodule Command.Producer.DeleteProducerCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Producer.DeleteProducerCommand {
        id: String.t
    }
end