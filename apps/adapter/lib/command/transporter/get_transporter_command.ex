defmodule Command.Transporter.GetTransporterCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Transporter.GetTransporterCommand {
        id: String.t
    }
end