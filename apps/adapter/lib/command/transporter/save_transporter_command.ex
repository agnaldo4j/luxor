defmodule Command.Transporter.SaveTransporterCommand do
    @moduledoc ""

    defstruct [
        :name
    ]

    @type t :: %Command.Transporter.SaveTransporterCommand {
        name: String.t
    }
end