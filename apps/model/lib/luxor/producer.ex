defmodule Luxor.Producer do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :name,
        :sex,
        :cpf,
        :phone
    ]

    @type t :: %Luxor.Producer {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        name: String.t,
        sex: String.t,
        cpf: String.t,
        phone: String.t
    }

    def identify(repo = %Luxor.Producer{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end