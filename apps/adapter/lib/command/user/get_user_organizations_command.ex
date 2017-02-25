defmodule Command.User.GetUserOrganizationsCommand do
    defstruct [
        :github_token
    ]

    @type t :: %Command.User.GetUserOrganizationsCommand {
        github_token: String.t
    }
  
end