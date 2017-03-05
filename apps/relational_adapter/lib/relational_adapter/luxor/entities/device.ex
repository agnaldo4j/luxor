defmodule RelationalAdapter.Luxor.Device do
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

    def from_business(domain = %Luxor.Device{}) do
        params = %{id: domain.id, created: domain.created, updated: domain.updated, serial_number: domain.serial_number, name: domain.name}
        changeset(%RelationalAdapter.Luxor.Device{}, params)
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
end
