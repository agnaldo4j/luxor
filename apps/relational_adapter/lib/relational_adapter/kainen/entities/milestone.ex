defmodule RelationalAdapter.Kaizen.Milestone do
    use RelationalAdapter.Model
    use Timex

    schema "milestones" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :end_at, Timex.Ecto.DateTime
        field :name, :string
        many_to_many :issues, RelationalAdapter.Kaizen.Issue, join_through: "milestones_issues"
    end

    def from_business(repo = %Kaizen.Milestone{}) do
        %RelationalAdapter.Kaizen.Milestone{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Kaizen.Milestone{}) do
        %Kaizen.Milestone{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
