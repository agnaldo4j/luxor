defmodule Command.Manager.GetManagerCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Manager.GetManagerCommand {
        id: String.t
    }
end