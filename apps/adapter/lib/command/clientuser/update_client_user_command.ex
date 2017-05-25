defmodule Command.ClientUser.UpdateClientUserCommand do
    @moduledoc ""

    defstruct [
        :id,
        :name,
        :email,
        :password
    ]

    @type t :: %Command.ClientUser.UpdateClientUserCommand {
        id: String.t,
        name: String.t,
        email: String.t,
        password: String.t
    }
end
