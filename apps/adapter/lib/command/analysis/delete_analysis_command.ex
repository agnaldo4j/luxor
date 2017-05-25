defmodule Command.Analysis.DeleteAnalysisCommand do
    @moduledoc ""

    defstruct [
        :id
    ]

    @type t :: %Command.Analysis.DeleteAnalysisCommand {
        id: String.t
    }
end
