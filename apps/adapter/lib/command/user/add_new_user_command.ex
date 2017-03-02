defmodule Command.User.AddNewUserCommand do
    defstruct [
        :email,
        :password,
        :active
    ]

    @type t :: %Command.User.AddNewUserCommand {
        email: String.t,
        password: String.t,
        active: Boolean.t
    }
end