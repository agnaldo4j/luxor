defmodule RelationalAdapter.Kaizen.Column do
    use RelationalAdapter.Model
    use Timex

    schema "columns" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :column_id, :string
        field :name, :string
        field :text, :string
        many_to_many :cards, RelationalAdapter.Kaizen.Column, join_through: "columns_cards"
    end

    def from_business(repo = %Kaizen.Column{}) do
        %RelationalAdapter.Kaizen.Column{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end

    def to_business(repo = %RelationalAdapter.Kaizen.Column{}) do
        %Kaizen.Column{
            id: repo.id,
            created: repo.created,
            updated: repo.updated
        }
    end
end
