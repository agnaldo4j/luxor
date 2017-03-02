defmodule Command.Client.AddNewClientCommand do
    defstruct [
        :serial_number,
        :name
    ]

    @type t :: %Command.Client.AddNewClientCommand {
        serial_number: String.t,
        name: String.t
    }
end