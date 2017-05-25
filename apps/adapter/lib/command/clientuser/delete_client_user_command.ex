defmodule Command.ClientUser.DeleteClientUserCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.ClientUser.DeleteClientUserCommand {
        id: String.t
    }
end
