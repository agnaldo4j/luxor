defmodule Command.Transporter.UpdateTransporterCommand do
    @moduledoc ""


    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.Transporter.UpdateTransporterCommand {
        id: String.t,
        name: String.t
    }
end