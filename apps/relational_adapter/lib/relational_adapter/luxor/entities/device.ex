defmodule RelationalAdapter.Luxor.Device do
    @moduledoc ""

    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "devices" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :serial_number, :string
        field :name, :string
    end

    def changeset(device, params \\ %{}) do
        device
        |> cast(params, [:id, :created, :updated, :serial_number, :name])
        |> validate_required([:id, :created, :updated, :serial_number, :name])
    end

    def change_state_to(actual_state = %RelationalAdapter.Luxor.Device{}, domain = %Luxor.Device{}) do
      changeset(actual_state, update_build_params(actual_state, domain))
    end

    def from_business(domain = %Luxor.Device{}) do
        changeset(%RelationalAdapter.Luxor.Device{}, build_params(domain))
    end

    def to_business(device = %RelationalAdapter.Luxor.Device{}) do
        %Luxor.Device{
            id: device.id,
            created: device.created,
            updated: device.updated,
            serial_number: device.serial_number,
            name: device.name
        }
    end

    defp build_params(domain) do
        %{
            id: domain.id,
            created: domain.created,
            updated: domain.updated,
            serial_number: domain.serial_number,
            name: domain.name
        }
    end

    defp update_build_params(actual_state, domain) do
        %{
            id: actual_state.id,
            created: actual_state.created,
            updated: DateTime.today,
            serial_number: domain.serial_number,
            name: domain.name
        }
    end
end
