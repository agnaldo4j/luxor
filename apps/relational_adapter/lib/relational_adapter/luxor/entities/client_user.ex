defmodule RelationalAdapter.Luxor.ClientUser do
    @moduledoc ""

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
      changeset(actual_state, update_build_params(actual_state, domain))
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
      client = %{id: domain.client.id, created: domain.client.created, updated: domain.client.updated, name: domain.client.name}
      user = %{id: domain.user.id, created: domain.user.created, updated: domain.user.updated, email: domain.user.email, password: domain.user.password, active: domain.user.active}
      %{id: domain.id, created: domain.created, updated: domain.updated, client: client, user: user}
    end

    defp update_build_params(actual_state, domain) do
        client = %{id: actual_state.client.id, created: actual_state.client.created, updated: DateTime.today, name: domain.client.name}
        user = %{id: actual_state.user.id, created: actual_state.user.created, updated: DateTime.today, email: domain.user.email, password: domain.user.password, active: domain.user.active}
        %{id: actual_state.id, created: actual_state.created, updated: DateTime.today, client: client, user: user}
    end
end
