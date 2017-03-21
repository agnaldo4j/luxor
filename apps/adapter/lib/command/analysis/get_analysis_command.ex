defmodule Command.Analysis.GetAnalysisCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Analysis.GetAnalysisCommand {
        id: String.t
    }
end