defmodule Command.User.AuthenticationUserCommand do
    defstruct [
        :email,
        :password
    ]

    @type t :: %Command.User.AuthenticationUserCommand {
        email: String.t,
        password: String.t
    }
end