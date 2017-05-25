defmodule RelationalAdapter.Luxor.Farm do
    @moduledoc ""

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

    def change_state_to(actual_state = %RelationalAdapter.Luxor.Farm{}, domain = %Luxor.Farm{}) do
      changeset(actual_state, update_build_params(actual_state, domain))
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

    defp update_build_params(actual_state, domain) do
        %{
            id: actual_state.id,
            created: actual_state.created,
            updated: DateTime.today,
            name: domain.name
        }
    end
end
