defmodule Command.User.AuthenticationUserCommand do
    defstruct [
        :email,
        :password
    ]

    @type t :: %Command.User.AuthenticationUserCommand {
        email: String.t,
        password: String.t
    }

    def new_from(conn) do
      %{ "email" => email, "password" => password } = conn.params
      %Command.User.AuthenticationUserCommand{ email: email, password: password }
    end
end