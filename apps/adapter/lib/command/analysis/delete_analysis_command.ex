defmodule Command.Analysis.DeleteAnalysisCommand do
    defstruct [
        :id
    ]

    @type t :: %Command.Analysis.DeleteAnalysisCommand {
        id: String.t
    }
end