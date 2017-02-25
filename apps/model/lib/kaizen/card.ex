defmodule Kaizen.Card do
    @derive [Poison.Encoder]

    defstruct [
        :id,
        :created,
        :updated,
        :card_id,
        :title,
        :issue
    ]

    @type t :: %Kaizen.Card {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        created: String.t,
        card_id: Integer.t,
        title: String.t,
        issue: Issue.t
    }
end
