defmodule Command.User.AddNewUserCommand do
    defstruct [
        :github_token
    ]

    @type t :: %Command.User.AddNewUserCommand {
        github_token: String.t
    }
  
end