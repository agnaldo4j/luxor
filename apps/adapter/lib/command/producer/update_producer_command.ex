defmodule Command.Producer.UpdateProducerCommand do
    @moduledoc ""


    defstruct [
        :id,
        :name,
        :sex,
        :cpf,
        :phone
    ]

    @type t :: %Command.Producer.UpdateProducerCommand {
        id: String.t,
        name: String.t,
        sex: String.t,
        cpf: String.t,
        phone: String.t
    }
end