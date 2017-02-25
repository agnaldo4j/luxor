defmodule RelationalAdapter.Kaizen.User do
    use RelationalAdapter.Model
    use Timex

    schema "users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :user_id, :integer
        field :name, :string
        field :email, :string
        field :password, :string
        field :github_token, :string
    end

    def from_business(user = %Kaizen.User{}) do
        %RelationalAdapter.Kaizen.User{
            id: user.id,
            created: user.created,
            updated: user.updated
        }
    end

    def to_business(user = %RelationalAdapter.Kaizen.User{}) do
        %Kaizen.User{
            id: user.id,
            created: user.created,
            updated: user.updated
        }
    end
end
