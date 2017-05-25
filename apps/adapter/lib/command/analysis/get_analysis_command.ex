defmodule Command.Analysis.GetAnalysisCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Analysis.GetAnalysisCommand {
        id: String.t
    }
end