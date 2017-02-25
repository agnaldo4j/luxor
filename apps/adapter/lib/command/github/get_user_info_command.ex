defmodule Command.Github.GetUserInfoCommand do
    defstruct [
        :token
    ]

    @type t :: %Command.Github.GetUserInfoCommand {
        token: String.t
    }
  
end