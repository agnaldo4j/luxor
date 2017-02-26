defmodule RelationalAdapter.Kaizen.Repo do
    use RelationalAdapter.Model
    use Timex

    schema "repos" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :repository_id, :string
        field :name, :string
        field :full_name, :string
        many_to_many :teams, RelationalAdapter.Kaizen.Team, join_through: "repos_teams"
        many_to_many :issues, RelationalAdapter.Kaizen.Issue, join_through: "repos_issues"
        many_to_many :projects, RelationalAdapter.Kaizen.Project, join_through: "repos_projects"
        many_to_many :milestones, RelationalAdapter.Kaizen.Milestone, join_through: "repos_milestones"
    end

    def from_business(repo = %Kaizen.Repo{}) do
        %RelationalAdapter.Kaizen.Repo{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Kaizen.Repo{}) do
        %Kaizen.Repo{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
