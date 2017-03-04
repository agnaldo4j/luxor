defmodule Luxor.ClientUser do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :client,
        :user
    ]

    @type t :: %Luxor.ClientUser {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        client: Client.t,
        user: User.t
    }

    def identify(repo = %Luxor.ClientUser{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end