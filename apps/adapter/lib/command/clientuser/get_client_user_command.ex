defmodule Command.ClientUser.GetClientUserCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.ClientUser.GetClientUserCommand {
        id: String.t
    }
end