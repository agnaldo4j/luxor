defmodule Command.Transporter.GetTransporterCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Transporter.GetTransporterCommand {
        id: String.t
    }
end