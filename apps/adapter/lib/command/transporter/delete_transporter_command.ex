defmodule Command.Transporter.DeleteTransporterCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Transporter.DeleteTransporterCommand {
        id: String.t
    }
end