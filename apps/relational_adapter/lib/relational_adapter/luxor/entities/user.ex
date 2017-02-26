defmodule RelationalAdapter.Luxor.User do
    use RelationalAdapter.Luxor.Model
    use Timex

    schema "users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
        field :email, :string
        field :password, :string
    end

    def from_business(user = %Luxor.User{}) do
        %RelationalAdapter.Luxor.User{
            id: user.id,
            created: user.created,
            updated: user.updated
        }
    end

    def to_business(user = %RelationalAdapter.Luxor.User{}) do
        %Luxor.User{
            id: user.id,
            created: user.created,
            updated: user.updated
        }
    end
end
