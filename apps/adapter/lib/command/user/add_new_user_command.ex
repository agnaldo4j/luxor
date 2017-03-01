defmodule Command.User.AddNewUserCommand do
    defstruct [
        :name,
        :email,
        :password
    ]

    @type t :: %Command.User.AddNewUserCommand {
        name: String.t,
        email: String.t,
        password: String.t
    }
end