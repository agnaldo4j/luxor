defmodule RelationalAdapter.Kaizen.Project do
    use RelationalAdapter.Model
    use Timex

    schema "projects" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :project_id, :string
        field :name, :string
        many_to_many :columns, RelationalAdapter.Kaizen.Column, join_through: "projects_columns"
    end

    def from_business(repo = %Kaizen.Project{}) do
        %RelationalAdapter.Kaizen.Project{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Kaizen.Project{}) do
        %Kaizen.Project{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
