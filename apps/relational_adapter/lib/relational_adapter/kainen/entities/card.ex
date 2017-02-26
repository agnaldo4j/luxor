defmodule RelationalAdapter.Kaizen.Card do
    use RelationalAdapter.Model
    use Timex

    schema "cards" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :card_id, :string
        field :title, :string
        many_to_many :issues, RelationalAdapter.Kaizen.Issue, join_through: "cards_issues"
    end

    def from_business(repo = %Kaizen.Card{}) do
        %RelationalAdapter.Kaizen.Card{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Kaizen.Card{}) do
        %Kaizen.Card{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
