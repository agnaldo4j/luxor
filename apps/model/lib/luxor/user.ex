defmodule Luxor.User do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :name,
        :email,
        :password
    ]

    @type t :: %Luxor.User {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        name: String.t,
        email: String.t,
        password: String.t
    }

    def identify(user = %Luxor.User{}) do
        %{user | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end
