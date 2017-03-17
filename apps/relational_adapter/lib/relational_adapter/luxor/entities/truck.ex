defmodule RelationalAdapter.Luxor.Truck do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "trucks" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def changeset(truck, params \\ %{}) do
        truck
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.Truck{}) do
        changeset(%RelationalAdapter.Luxor.Truck{}, build_params(domain))
    end

    def to_business(truck = %RelationalAdapter.Luxor.Truck{}) do
        %Luxor.Truck{
            id: truck.id,
            created: truck.created,
            updated: truck.updated,
            name: truck.name
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
