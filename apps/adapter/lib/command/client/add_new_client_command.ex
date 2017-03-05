defmodule Command.Client.AddNewClientCommand do
    defstruct [
        :name,
        :email,
        :password
    ]

    @type t :: %Command.Client.AddNewClientCommand {
        name: String.t,
        email: String.t,
        password: String.t
    }
end