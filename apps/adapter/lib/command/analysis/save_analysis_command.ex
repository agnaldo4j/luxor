defmodule Command.Analysis.SaveAnalysisCommand do
    defstruct [
        :name
    ]

    @type t :: %Command.Analysis.SaveAnalysisCommand {
        name: String.t
    }
end