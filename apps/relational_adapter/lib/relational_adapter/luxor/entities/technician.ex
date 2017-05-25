defmodule RelationalAdapter.Luxor.Technician do
    @moduledoc ""

    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "technicians" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
        many_to_many :technical_teams, RelationalAdapter.Luxor.TechnicalTeam, join_through: "technical_teams"
    end

    def changeset(technician, params \\ %{}) do
        technician
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.Technician{}) do
        changeset(%RelationalAdapter.Luxor.Technician{}, build_params(domain))
    end

    def to_business(technician = %RelationalAdapter.Luxor.Technician{}) do
        %Luxor.Technician{
            id: technician.id,
            created: technician.created,
            updated: technician.updated,
            name: technician.name
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
