defmodule Kaizen.Team do
    @derive [Poison.Encoder]

    defstruct [
        :id,
        :created,
        :updated,
        :name,
        :users
    ]

    @type t :: %Kaizen.Team {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        name: String.t,
        users: List.t
    }
end
