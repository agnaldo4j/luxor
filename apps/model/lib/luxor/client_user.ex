defmodule Luxor.ClientUser do
    @moduledoc ""

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
        client: Luxor.Client.t,
        user: Luxor.User.t
    }

    def identify(repo = %Luxor.ClientUser{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end