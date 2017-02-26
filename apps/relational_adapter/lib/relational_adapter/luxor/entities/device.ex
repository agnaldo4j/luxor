defmodule RelationalAdapter.Luxor.Device do
    use RelationalAdapter.Luxor.Model
    use Timex

    schema "repos" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :serial_number, :string
        field :name, :string
    end

    def from_business(repo = %Luxor.Device{}) do
        %RelationalAdapter.Luxor.Device{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Luxor.Device{}) do
        %Luxor.Device{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
