defmodule Command.Producer.SaveProducerCommand do
    defstruct [
        :name,
        :sex,
        :cpf,
        :phone
    ]

    @type t :: %Command.Producer.SaveProducerCommand {
        name: String.t,
        sex: String.t,
        cpf: String.t,
        phone: String.t
    }
end