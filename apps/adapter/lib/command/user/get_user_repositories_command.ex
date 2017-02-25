defmodule Command.User.GetUserRepositoriesCommand do
    defstruct [
        :github_token
    ]

    @type t :: %Command.User.GetUserRepositoriesCommand {
        github_token: String.t
    }
  
end