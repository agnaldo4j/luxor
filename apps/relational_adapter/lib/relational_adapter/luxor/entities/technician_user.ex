defmodule RelationalAdapter.Luxor.TechnicianUser do
    @moduledoc ""

    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "technician_users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        belongs_to :technician, RelationalAdapter.Luxor.Technician
        belongs_to :user, RelationalAdapter.Luxor.User
    end

    def changeset(technician_user, params \\ %{}) do
        technician_user
        |> cast(params, [:id, :created, :updated])
        |> cast_assoc(:technician)
        |> cast_assoc(:user)
        |> validate_required([:id, :created, :updated, :technician, :user])
    end

    def from_business(domain = %Luxor.TechnicianUser{}) do
        changeset(%RelationalAdapter.Luxor.TechnicianUser{}, build_params(domain))
    end

    def to_business(technician_user = %RelationalAdapter.Luxor.TechnicianUser{}) do
        %Luxor.TechnicianUser{
            id: technician_user.id,
            created: technician_user.created,
            updated: technician_user.updated,
            technician: RelationalAdapter.Luxor.Technician.to_business(technician_user.technician),
            user: RelationalAdapter.Luxor.User.to_business(technician_user.user)
        }
    end

    defp build_params(domain) do
      technician = build_technician_params(domain.technician)
      user = build_user_params(domain.user)
      %{
        id: domain.id,
        created: domain.created,
        updated: domain.updated,
        technician: technician,
        user: user
      }
    end

    defp build_technician_params(domain) do
      %{
        id: domain.id,
        created: domain.created,
        updated: domain.updated,
        name: domain.name
      }
    end

    defp build_user_params(domain) do
      %{
        id: domain.id,
        created: domain.created,
        updated: domain.updated,
        email: domain.email,
        password: domain.password,
        active: domain.active
      }
    end
end
