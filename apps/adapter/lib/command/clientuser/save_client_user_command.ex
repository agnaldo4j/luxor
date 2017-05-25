defmodule Command.ClientUser.SaveClientUserCommand do
    @moduledoc ""

    defstruct [
        :name,
        :email,
        :password
    ]

    @type t :: %Command.ClientUser.SaveClientUserCommand {
        name: String.t,
        email: String.t,
        password: String.t
    }
end
