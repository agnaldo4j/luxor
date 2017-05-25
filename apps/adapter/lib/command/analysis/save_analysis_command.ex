defmodule Command.Analysis.SaveAnalysisCommand do
    @moduledoc ""

    defstruct [
        :name
    ]

    @type t :: %Command.Analysis.SaveAnalysisCommand {
        name: String.t
    }
end