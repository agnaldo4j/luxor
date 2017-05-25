defmodule Command.Manager.SaveManagerCommand do
    @moduledoc ""

    defstruct [
        :name
    ]

    @type t :: %Command.Manager.SaveManagerCommand {
        name: String.t
    }
end
