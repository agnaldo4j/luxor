defmodule RelationalAdapter.Luxor.Producer do
    use RelationalAdapter.Luxor.Model
    use Timex
    import Ecto.Changeset

    schema "producers" do
        field :created, Timex.Ecto.DateTime
        field :updated, Timex.Ecto.DateTime
        field :name, :string
        field :sex, :string
        field :cpf, :string
        field :phone, :string
    end

    def changeset(producer, params \\ %{}) do
        producer
        |> cast(params, [:id, :created, :updated, :name, :sex, :cpf, :phone])
        |> validate_required([:id, :created, :updated, :name, :sex, :cpf, :phone])
    end

    def from_business(domain = %Luxor.Producer{}) do
        changeset(%RelationalAdapter.Luxor.Producer{}, build_params(domain))
    end

    def change_state_to(actual_state = %RelationalAdapter.Luxor.Producer{}, domain = %Luxor.Producer{}) do
      changeset(actual_state, update_build_params(actual_state, domain))
    end

    def to_business(producer = %RelationalAdapter.Luxor.Producer{}) do
        %Luxor.Producer{
            id: producer.id,
            created: producer.created,
            updated: producer.updated,
            name: producer.name,
            sex: producer.sex,
            cpf: producer.cpf,
            phone: producer.phone
        }
    end

    defp build_params(domain) do
        %{
            id: domain.id,
            created: domain.created,
            updated: domain.updated,
            name: domain.name,
            sex: domain.sex,
            cpf: domain.cpf,
            phone: domain.phone
        }
    end

    defp update_build_params(actual_state, domain) do
        %{
            id: actual_state.id,
            created: actual_state.created,
            updated: DateTime.today,
            name: domain.name,
            sex: domain.sex,
            cpf: domain.cpf,
            phone: domain.phone
        }
    end
end
