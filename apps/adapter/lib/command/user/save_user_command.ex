defmodule Command.User.SaveUserCommand do
    defstruct [
        :email,
        :password,
        :active
    ]

    @type t :: %Command.User.SaveUserCommand {
        email: String.t,
        password: String.t,
        active: Bollean.t
    }
end