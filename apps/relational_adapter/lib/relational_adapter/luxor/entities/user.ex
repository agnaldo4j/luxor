defmodule RelationalAdapter.Luxor.User do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "users" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :email, :string
        field :password, :string
        field :active, :boolean
    end

    def changeset(user, params \\ %{}) do
        user
        |> cast(params, [:id, :created, :updated, :password, :email, :active])
        |> validate_required([:id, :created, :updated, :password, :email, :active])
        |> validate_format(:email, ~r/@/)
        |> unique_constraint(:email)
    end

    def change_state_to(actual_state = %RelationalAdapter.Luxor.User{}, domain = %Luxor.User{}) do
      changeset(actual_state, update_build_params(actual_state, domain))
    end

    def from_business(domain = %Luxor.User{}) do
        changeset(%RelationalAdapter.Luxor.User{}, build_params(domain))
    end

    def to_business(user = %RelationalAdapter.Luxor.User{}) do
        %Luxor.User{
            id: user.id,
            created: user.created,
            updated: user.updated,
            email: user.email,
            password: user.password,
            active: user.active
        }
    end

    def to_business({:ok, user}) do
        {
            :ok,
            %Luxor.User{
                id: user.id,
                created: user.created,
                updated: user.updated,
                email: user.email,
                password: user.password,
                active: user.active
            }
        }
    end

    def to_business({:error, errors}) do
        {:error, errors}
    end

    defp build_params(domain) do
        %{
            id: domain.id,
            created: domain.created,
            updated: domain.updated,
            email: domain.email,
            password: domain.password,
            active: domain.active
        }
    end

    defp update_build_params(actual_state, domain) do
        %{
            id: actual_state.id,
            created: actual_state.created,
            updated: DateTime.today,
            email: domain.email,
            password: domain.password,
            active: domain.active
        }
    end
end
