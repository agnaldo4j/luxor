defmodule RelationalAdapter.Kaizen.Organization do
    use RelationalAdapter.Model
    use Timex

    schema "organizations" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :forganization_id, :string
        field :name, :string
        many_to_many :projects, RelationalAdapter.Kaizen.Project, join_through: "organizations_projects"
        many_to_many :teams, RelationalAdapter.Kaizen.Team, join_through: "organizations_teams"
    end

    def from_business(repo = %Kaizen.Organization{}) do
        %RelationalAdapter.Kaizen.Organization{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Kaizen.Organization{}) do
        %Kaizen.Organization{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
