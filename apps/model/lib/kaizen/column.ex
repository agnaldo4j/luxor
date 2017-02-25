defmodule Kaizen.Column do
    @derive [Poison.Encoder]

    defstruct [
        :id,
        :created,
        :updated,
        :column_id,
        :name,
        :text,
        :cards
    ]

    @type t :: %Kaizen.Column {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        column_id: Integer.t,
        name: String.t,
        text: String.t,
        cards: List.t
    }
end
