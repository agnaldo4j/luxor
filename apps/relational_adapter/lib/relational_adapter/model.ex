defmodule RelationalAdapter.Luxor.Model do
    @moduledoc ""

    defmacro __using__(_) do
        quote do
            use Ecto.Schema
            @primary_key {:id, :string, autogenerate: false}
            @foreign_key_type :string
        end
    end
end
