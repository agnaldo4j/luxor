defmodule Kaizen.Issue do
    @derive [Poison.Encoder]

    defstruct [
        :id,
        :created,
        :updated,
        :issue_id,
        :number,
        :title,
        :text,
        :state,
        :assignees
    ]

    @type t :: %Kaizen.Issue {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        issue_id: Integer.t,
        number: Integer.t,
        title: String.t,
        text: String.t,
        state: String.t,
        assignees: List.t
    }
end
