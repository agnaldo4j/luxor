defmodule RelationalAdapter.Luxor.User do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :email, :string
        field :password, :string
        field :active, :boolean
    end

    def changeset(user, params \\ %{}) do
        user
        |> cast(params, [:id, :created, :updated, :password, :email, :active])
        |> validate_required([:id, :created, :updated, :password, :email, :active])
        |> validate_format(:email, ~r/@/)
        |> unique_constraint(:email)
    end

    def from_business(domain = %Luxor.User{}) do
        params = %{id: domain.id, created: domain.created, updated: domain.updated, email: domain.email, password: domain.password, active: domain.active}
        changeset(%RelationalAdapter.Luxor.User{}, params)
    end

    def to_business(user = %RelationalAdapter.Luxor.User{}) do
        %Luxor.User{
            id: user.id,
            created: user.created,
            updated: user.updated,
            email: user.email,
            password: user.password,
            active: user.active
        }
    end
end
