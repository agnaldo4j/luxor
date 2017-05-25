defmodule RestApi do
    @moduledoc ""

    use Application

    def start(_type, _args) do
        {:ok, _} = Plug.Adapters.Cowboy.http AppRouter, []
    end
end
