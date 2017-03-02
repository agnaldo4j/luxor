defmodule RelationalAdapter.Luxor.Client do
    use RelationalAdapter.Luxor.Model
    use Timex

    schema "clients" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def from_business(device = %Luxor.Client{}) do
        %RelationalAdapter.Luxor.Client{
            id: device.id,
            created: device.created,
            updated: device.updated,
            name: device.name
        }
    end

    def to_business(device = %RelationalAdapter.Luxor.Client{}) do
        %Luxor.Client{
            id: device.id,
            created: device.created,
            updated: device.updated,
            name: device.name
        }
    end
end
