defmodule RelationalAdapter.Luxor.ClientUser do
    use RelationalAdapter.Luxor.Model
    use Timex

    schema "client_users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        belongs_to :client, RelationalAdapter.Luxor.Client
        belongs_to :user, RelationalAdapter.Luxor.User
    end

    def from_business(clientUser = %Luxor.ClientUser{}) do
        %RelationalAdapter.Luxor.ClientUser{
            id: clientUser.id,
            created: clientUser.created,
            updated: clientUser.updated,
            client: RelationalAdapter.Luxor.Client.from_business(clientUser.client),
            user: RelationalAdapter.Luxor.Client.from_business(clientUser.user)
        }
    end

    def to_business(clientUser = %RelationalAdapter.Luxor.ClientUser{}) do
        %Luxor.ClientUser{
            id: clientUser.id,
            created: clientUser.created,
            updated: clientUser.updated,
            client: RelationalAdapter.Luxor.Client.to_business(clientUser.client),
            user: RelationalAdapter.Luxor.User.to_business(clientUser.user)
        }
    end
end
