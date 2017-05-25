defmodule Command.Manager.GetManagerCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Manager.GetManagerCommand {
        id: String.t
    }
end