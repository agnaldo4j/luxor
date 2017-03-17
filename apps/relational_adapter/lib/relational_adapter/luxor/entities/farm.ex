defmodule RelationalAdapter.Luxor.Farm do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "farms" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def changeset(farm, params \\ %{}) do
        farm
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.Farm{}) do
        changeset(%RelationalAdapter.Luxor.Farm{}, build_params(domain))
    end

    def to_business(farm = %RelationalAdapter.Luxor.Farm{}) do
        %Luxor.Farm{
            id: farm.id,
            created: farm.created,
            updated: farm.updated,
            name: farm.name
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
