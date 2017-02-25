defmodule Command.Github.GetUserOrganizationsCommand do
    defstruct [
        :token
    ]

    @type t :: %Command.Github.GetUserOrganizationsCommand {
        token: String.t
    }
  
end