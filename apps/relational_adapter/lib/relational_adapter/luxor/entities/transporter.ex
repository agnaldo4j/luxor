defmodule RelationalAdapter.Luxor.Transporter do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "transporters" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
    end

    def changeset(transporter, params \\ %{}) do
        transporter
        |> cast(params, [:id, :created, :updated, :name])
        |> validate_required([:id, :created, :updated, :name])
    end

    def from_business(domain = %Luxor.Transporter{}) do
        changeset(%RelationalAdapter.Luxor.Transporter{}, build_params(domain))
    end

    def to_business(transporter = %RelationalAdapter.Luxor.Transporter{}) do
        %Luxor.Transporter{
            id: transporter.id,
            created: transporter.created,
            updated: transporter.updated,
            name: transporter.name
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
end
