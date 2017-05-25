defimpl Poison.Encoder, for: Timex.DateTime do
    @moduledoc ""

    use Timex
    def encode(d, _options) do
        fmt = Timex.Format.DateTime.Formatter.format!(d, "{ISO}")
        "\"#{fmt}\""
    end
end
