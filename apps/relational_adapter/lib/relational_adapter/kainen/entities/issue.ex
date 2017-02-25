defmodule RelationalAdapter.Kaizen.Issue do
    use RelationalAdapter.Model
    use Timex

    schema "issues" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :end_at, Timex.Ecto.DateTime
        field :issue_id, :string
        field :number, :integer
        field :title, :string
        field :text, :text
        field :state, :string
        many_to_many :assignees, RelationalAdapter.Kaizen.User, join_through: "issues_assignees"
    end

    def from_business(repo = %Kaizen.Issue{}) do
        %RelationalAdapter.Kaizen.Issue{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Kaizen.Issue{}) do
        %Kaizen.Issue{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
