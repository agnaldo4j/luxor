defmodule Command.Producer.DeleteProducerCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Producer.DeleteProducerCommand {
        id: String.t
    }
end