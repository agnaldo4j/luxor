defmodule RelationalAdapter.Kaizen.Team do
    use RelationalAdapter.Model
    use Timex

    schema "teams" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, string
        many_to_many :users, RelationalAdapter.Kaizen.User, join_through: "teams_users"
    end

    def from_business(user = %Kaizen.Team{}) do
        %RelationalAdapter.Kaizen.Team{
            id: user.id,
            created: user.created,
            updated: user.updated
        }
    end

    def to_business(user = %RelationalAdapter.Kaizen.Team{}) do
        %Kaizen.Team{
            id: user.id,
            created: user.created,
            updated: user.updated
        }
    end
end
