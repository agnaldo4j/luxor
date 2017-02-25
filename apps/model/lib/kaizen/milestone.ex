defmodule Kaizen.Milestone do
    @derive [Poison.Encoder]

    defstruct [
        :id,
        :created,
        :updated,
        :end_at,
        :name,
        :issues
    ]

    @type t :: %Kaizen.Milestone {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        end_at: Timex.DateTime,
        name: String.t,
        issues: List.t
    }
end
