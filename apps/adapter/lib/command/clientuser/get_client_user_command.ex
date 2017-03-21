defmodule Command.ClientUser.GetClientUserCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.ClientUser.GetClientUserCommand {
        id: String.t
    }
end