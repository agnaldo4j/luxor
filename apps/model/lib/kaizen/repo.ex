defmodule Kaizen.Repo do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :repository_id,
        :name,
        :full_name,
        :teams,
        :issues,
        :projects,
        :milestones
    ]

    @type t :: %Kaizen.Repo {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        repository_id: Integer.t,
        name: String.t,
        full_name: String.t,
        teams: List.t,
        issues: List.t,
        projects: List.t,
        milestones: List.t
    }

    def identify(repo = %Kaizen.Repo{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end