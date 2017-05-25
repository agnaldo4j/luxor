defmodule Command.Manager.DeleteManagerCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Manager.DeleteManagerCommand {
        id: String.t
    }
end