defmodule Command.Github.GetUserRepositoriesCommand do
    defstruct [
        :token
    ]

    @type t :: %Command.Github.GetUserRepositoriesCommand {
        token: String.t
    }
  
end