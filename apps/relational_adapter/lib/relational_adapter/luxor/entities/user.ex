defmodule RelationalAdapter.Luxor.User do
    use RelationalAdapter.Luxor.Model
    use Timex

    schema "users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :email, :string
        field :password, :string
        field :active, :boolean
    end

    def from_business(user = %Luxor.User{}) do
        %RelationalAdapter.Luxor.User{
            id: user.id,
            created: user.created,
            updated: user.updated,
            email: user.email,
            password: user.password,
            active: user.active
        }
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
