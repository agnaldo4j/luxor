defmodule RelationalAdapter.Luxor.TechnicalTeamTechnician do
    @moduledoc ""

    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "technical_team_technicians" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
        belongs_to :technical_team, RelationalAdapter.Luxor.TechnicalTeam
        belongs_to :technician, RelationalAdapter.Luxor.Technician
    end

    def changeset(technical_team_technician, params \\ %{}) do
        technical_team_technician
        |> cast(params, [:id, :created, :updated, :name])
        |> cast_assoc(:technician_team)
        |> cast_assoc(:technician)
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.TechnicalTeamTechnician{}) do
        changeset(%RelationalAdapter.Luxor.TechnicalTeamTechnician{}, build_params(domain))
    end

    def to_business(technical_team_technician = %RelationalAdapter.Luxor.TechnicalTeamTechnician{}) do
        %Luxor.TechnicalTeamTechnician{
            id: technical_team_technician.id,
            created: technical_team_technician.created,
            updated: technical_team_technician.updated,
            name: technical_team_technician.name
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
