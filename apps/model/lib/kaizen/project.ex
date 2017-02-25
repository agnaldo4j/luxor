defmodule Kaizen.Project do
    @derive [Poison.Encoder]

    defstruct [
        :id,
        :created,
        :updated,
        :project_id,
        :name,
        :columns
    ]

    @type t :: %Kaizen.Project {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        project_id: Integer.t,
        name: String.t,
        columns: List.t
    }
end
