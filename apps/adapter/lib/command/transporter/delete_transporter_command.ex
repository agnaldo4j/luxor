defmodule Command.Transporter.DeleteTransporterCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Transporter.DeleteTransporterCommand {
        id: String.t
    }
end