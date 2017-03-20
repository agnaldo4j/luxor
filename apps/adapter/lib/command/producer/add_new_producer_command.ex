defmodule Command.Producer.AddNewProducerCommand do
    defstruct [
        :name,
        :sex,
        :cpf,
        :phone
    ]

    @type t :: %Command.Producer.AddNewProducerCommand {
        name: String.t,
        sex: String.t,
        cpf: String.t,
        phone: String.t
    }
end