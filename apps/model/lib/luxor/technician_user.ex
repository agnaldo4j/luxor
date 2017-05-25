defmodule Luxor.TechnicianUser do
    @moduledoc ""

    @derive [Poison.Encoder]
    use Timex

    defstruct [
        :id,
        :created,
        :updated,
        :technician,
        :user
    ]

    @type t :: %Luxor.TechnicianUser {
        id: String.t,
        created: Timex.DateTime,
        updated: Timex.DateTime,
        technician: Luxor.Technician.t,
        user: Luxir.User.t
    }

    def identify(repo = %Luxor.TechnicianUser{}) do
        %{repo | id: UUID.uuid4(), created: DateTime.today, updated: DateTime.today}
    end
end
