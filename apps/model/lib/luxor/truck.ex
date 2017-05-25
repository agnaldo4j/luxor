defmodule Luxor.Truck do
    @moduledoc ""

    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :name
    ]

    @type t :: %Luxor.Truck {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        name: String.t
    }

    def identify(repo = %Luxor.Truck{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end