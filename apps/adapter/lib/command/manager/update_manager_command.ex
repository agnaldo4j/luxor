defmodule Command.Manager.UpdateManagerCommand do
    @moduledoc ""


    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.Manager.UpdateManagerCommand {
        id: String.t,
        name: String.t
    }
end