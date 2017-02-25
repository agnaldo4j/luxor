defmodule Command.User.GetUserRootInfoCommand do
    defstruct [
        :github_token
    ]

    @type t :: %Command.User.GetUserRootInfoCommand {
        github_token: String.t
    }
  
end