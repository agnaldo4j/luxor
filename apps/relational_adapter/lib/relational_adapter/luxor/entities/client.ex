defmodule RelationalAdapter.Luxor.Client do
    use RelationalAdapter.Luxor.Model
    use Timex

    schema "clients" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def from_business(client = %Luxor.Client{}) do
        %RelationalAdapter.Luxor.Client{
            id: client.id,
            created: client.created,
            updated: client.updated,
            name: client.name
        }
    end

    def to_business(client = %RelationalAdapter.Luxor.Client{}) do
        %Luxor.Client{
            id: client.id,
            created: client.created,
            updated: client.updated,
            name: client.name
        }
    end
end
