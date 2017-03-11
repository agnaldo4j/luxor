defmodule RelationalAdapter.Luxor.Animal do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "animals" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :register_number, :string
        field :breed, :string
        belongs_to :producer, RelationalAdapter.Luxor.Producer
    end

    def changeset(animal, params \\ %{}) do
        animal
        |> cast(params, [:id, :created, :updated, :register_number, :breed])
        |> cast_assoc(:producer)
        |> validate_required([:id, :created, :updated, :register_number, :breed, :producer])
    end

    def from_business(domain = %Luxor.Animal{}) do
        changeset(%RelationalAdapter.Luxor.Animal{}, build_params(domain))
    end

    def to_business(animal = %RelationalAdapter.Luxor.Animal{}) do
        %Luxor.Animal{
            id: animal.id,
            created: animal.created,
            updated: animal.updated,
            register_number: animal.register_number,
            breed: animal.breed,
            producer: animal.producer
        }
    end

    defp build_params(domain) do
        %{
            id: domain.id,
            created: domain.created,
            updated: domain.updated,
            register_number: domain.register_number,
            breed: domain.breed,
            producer: domain.producer
        }
    end
end
