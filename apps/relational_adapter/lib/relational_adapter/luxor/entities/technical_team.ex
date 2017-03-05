defmodule RelationalAdapter.Luxor.TechnicalTeam do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "technical_teams" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
        belongs_to :client, RelationalAdapter.Luxor.Client
        many_to_many :technicians, RelationalAdapter.Luxor.Technician, join_through: "technical_team_technicians"
    end

    def changeset(technical_team, params \\ %{}) do
        technical_team
        |> cast(params, [:id, :created, :updated, :name])
        |> cast_assoc(:client)
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.TechnicalTeam{}) do
        changeset(%RelationalAdapter.Luxor.TechnicalTeam{}, build_params(domain))
    end

    def to_business(technical_team = %RelationalAdapter.Luxor.TechnicalTeam{}) do
        %Luxor.TechnicalTeam{
            id: technical_team.id,
            created: technical_team.created,
            updated: technical_team.updated,
            name: technical_team.name
        }
    end

    defp build_params(domain) do
        %{
            id: domain.id,
            created: domain.created,
            updated: domain.updated,
            name: domain.name
        }
    end
end
