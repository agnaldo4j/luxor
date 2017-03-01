defmodule RelationalAdapter.Luxor.Device do
    use RelationalAdapter.Luxor.Model
    use Timex

    schema "devices" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :serial_number, :string
        field :name, :string
    end

    def from_business(device = %Luxor.Device{}) do
        %RelationalAdapter.Luxor.Device{
            id: device.id,
            created: device.created,
            updated: device.updated,
            serial_number: device.serial_number,
            name: device.name
        }
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
