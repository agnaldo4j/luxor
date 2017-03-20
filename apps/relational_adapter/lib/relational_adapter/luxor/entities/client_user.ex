defmodule RelationalAdapter.Luxor.ClientUser do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "client_users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        belongs_to :client, RelationalAdapter.Luxor.Client
        belongs_to :user, RelationalAdapter.Luxor.User
    end

    def changeset(client_user, params \\ %{}) do
        client_user
        |> cast(params, [:id, :created, :updated])
        |> cast_assoc(:client)
        |> cast_assoc(:user)
        |> validate_required([:id, :created, :updated, :client, :user])
    end

    def from_business(domain = %Luxor.ClientUser{}) do
        changeset(%RelationalAdapter.Luxor.ClientUser{}, build_params(domain))
    end

   def change_state_to(actual_state = %RelationalAdapter.Luxor.ClientUser{}, domain = %Luxor.ClientUser{}) do
      #changeset(actual_state, update_build_params(actual_state, domain))
    end

    def to_business(client_user = %RelationalAdapter.Luxor.ClientUser{}) do
        %Luxor.ClientUser{
            id: client_user.id,
            created: client_user.created,
            updated: client_user.updated,
            client: RelationalAdapter.Luxor.Client.to_business(client_user.client),
            user: RelationalAdapter.Luxor.User.to_business(client_user.user)
        }
    end

    defp build_params(domain) do
      client = build_client_params(domain.client)
      user = build_user_params(domain.user)
      %{
        id: domain.id,
        created: domain.created,
        updated: domain.updated,
        client: client,
        user: user
      }
    end

    defp build_client_params(domain) do
      %{
        id: domain.id,
        created: domain.created,
        updated: domain.updated,
        name: domain.name
      }
    end

    defp build_user_params(domain) do
      %{
        id: domain.id,
        created: domain.created,
        updated: domain.updated,
        email: domain.email,
        password: domain.password,
        active: domain.active
      }
    end
end
