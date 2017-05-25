defmodule Command.Producer.GetProducerCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Producer.GetProducerCommand {
        id: String.t
    }
end
