defmodule RelationalAdapter.Luxor.TruckDriver do
    @moduledoc ""

    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "truck_drivers" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def changeset(truck_driver, params \\ %{}) do
        truck_driver
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def change_state_to(actual_state = %RelationalAdapter.Luxor.TruckDriver{}, domain = %Luxor.TruckDriver{}) do
      changeset(actual_state, update_build_params(actual_state, domain))
    end

    def from_business(domain = %Luxor.TruckDriver{}) do
        changeset(%RelationalAdapter.Luxor.TruckDriver{}, build_params(domain))
    end

    def to_business(truck_driver = %RelationalAdapter.Luxor.TruckDriver{}) do
        %Luxor.TruckDriver{
            id: truck_driver.id,
            created: truck_driver.created,
            updated: truck_driver.updated,
            name: truck_driver.name
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
