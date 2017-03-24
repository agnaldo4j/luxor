defmodule RelationalAdapter.Luxor.Manager do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "managers" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def changeset(manager, params \\ %{}) do
        manager
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def change_state_to(actual_state = %RelationalAdapter.Luxor.Manager{}, domain = %Luxor.Manager{}) do
      changeset(actual_state, update_build_params(actual_state, domain))
    end

    def from_business(domain = %Luxor.Manager{}) do
        changeset(%RelationalAdapter.Luxor.Manager{}, build_params(domain))
    end

    def to_business(manager = %RelationalAdapter.Luxor.Manager{}) do
        %Luxor.Manager{
            id: manager.id,
            created: manager.created,
            updated: manager.updated,
            name: manager.name
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
