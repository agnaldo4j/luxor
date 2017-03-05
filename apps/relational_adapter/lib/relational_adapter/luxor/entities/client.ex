defmodule RelationalAdapter.Luxor.Client do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "clients" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def changeset(client, params \\ %{}) do
        client
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.Client{}) do
        params = %{id: domain.id, created: domain.created, updated: domain.updated, name: domain.name}
        changeset(%RelationalAdapter.Luxor.Client{}, params)
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
