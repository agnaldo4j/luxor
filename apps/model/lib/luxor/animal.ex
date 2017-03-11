defmodule Luxor.Animal do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :register_number,
        :breed,
        :producer
    ]

    @type t :: %Luxor.Animal {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        register_number: String.t,
        breed: String.t,
        producer: Luxor.Producer.t
    }

    def identify(repo = %Luxor.Animal{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end