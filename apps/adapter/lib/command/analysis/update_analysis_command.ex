defmodule Command.Analysis.UpdateAnalysisCommand do
    @moduledoc ""

    defstruct [
        :id,
        :name
    ]

    @type t :: %Command.Analysis.UpdateAnalysisCommand {
        id: String.t,
        name: String.t
    }
end