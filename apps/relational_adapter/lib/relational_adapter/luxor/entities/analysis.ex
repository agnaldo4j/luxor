defmodule RelationalAdapter.Luxor.Analysis do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "analyzes" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def changeset(analysis, params \\ %{}) do
        analysis
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.Analysis{}) do
        changeset(%RelationalAdapter.Luxor.Analysis{}, build_params(domain))
    end

    def to_business(analysis = %RelationalAdapter.Luxor.Analysis{}) do
        %Luxor.Analysis{
            id: analysis.id,
            created: analysis.created,
            updated: analysis.updated,
            name: analysis.name
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
