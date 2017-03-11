defmodule Luxor.Analysis do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :name
    ]

    @type t :: %Luxor.Analysis {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        name: String.t
    }

    def identify(repo = %Luxor.Analysis{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end