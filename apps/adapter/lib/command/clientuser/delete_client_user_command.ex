defmodule Command.ClientUser.DeleteClientUserCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.ClientUser.DeleteClientUserCommand {
        id: String.t
    }
end