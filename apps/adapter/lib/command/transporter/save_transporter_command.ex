defmodule Command.Transporter.SaveTransporterCommand do
    defstruct [
        :name
    ]

    @type t :: %Command.Transporter.SaveTransporterCommand {
        name: String.t
    }
end