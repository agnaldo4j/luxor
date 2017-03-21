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

    def change_state_to(actual_state = %RelationalAdapter.Luxor.Analysis{}, domain = %Luxor.Analysis{}) do
      changeset(actual_state, update_build_params(actual_state, domain))
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

    defp update_build_params(actual_state, domain) do
        %{
            id: actual_state.id,
            created: actual_state.created,
            updated: DateTime.today,
            name: domain.name
        }
    end
end
