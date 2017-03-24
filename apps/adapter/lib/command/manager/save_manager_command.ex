defmodule Command.Manager.SaveManagerCommand do
    defstruct [
        :name
    ]

    @type t :: %Command.Manager.SaveManagerCommand {
        name: String.t
    }
end