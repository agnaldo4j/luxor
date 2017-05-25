defmodule Luxor.Device do
    @moduledoc ""

    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :serial_number,
        :name
    ]

    @type t :: %Luxor.Device {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        serial_number: String.t,
        name: String.t
    }

    def identify(repo = %Luxor.Device{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end