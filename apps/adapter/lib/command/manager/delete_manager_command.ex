defmodule Command.Manager.DeleteManagerCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Manager.DeleteManagerCommand {
        id: String.t
    }
end