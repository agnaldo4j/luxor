defmodule Command.Github.GetUserRootInfoCommand do
    defstruct [
        :token
    ]

    @type t :: %Command.Github.GetUserRootInfoCommand {
        token: String.t
    }
  
end