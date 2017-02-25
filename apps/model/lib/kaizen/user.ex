defmodule Kaizen.User do
    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :user_id,
        :name,
        :email,
        :password,
        :github_token
    ]

    @type t :: %Kaizen.User {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        user_id: Integer.t,
        name: String.t,
        email: String.t,
        password: String.t,
        github_token: String.t
    }

    def identify(user = %Kaizen.User{}) do
        %{user | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end
