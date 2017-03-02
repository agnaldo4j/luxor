defmodule Luxor.User do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :email,
        :password,
        :active
    ]

    @type t :: %Luxor.User {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        email: String.t,
        password: String.t,
        active: Boolean.t
    }

    def identify(user = %Luxor.User{}) do
        %{user | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end
