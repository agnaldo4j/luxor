defmodule Command.Manager.UpdateManagerCommand do

    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.Manager.UpdateManagerCommand {
        id: String.t,
        name: String.t
    }
end