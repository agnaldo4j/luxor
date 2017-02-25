defmodule Kaizen.Organization do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :organization_id,
        :name,
        :projects,
        :teams
    ]

    @type t :: %Kaizen.Organization {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        organization_id: Integer.t,
        name: String.t,
        projects: List.t,
        teams: List.t
    }

    def identify(organization = %Kaizen.Organization{}) do
        %{organization | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end
