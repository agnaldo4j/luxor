defmodule Command.Client.SaveClientCommand do
    defstruct [
        :name,
        :email,
        :password
    ]

    @type t :: %Command.Client.SaveClientCommand {
        name: String.t,
        email: String.t,
        password: String.t
    }
end