defmodule RelationalAdapter.Luxor.AnimalRepository do
    @moduledoc ""

    import Ecto.Query

    def save(changeset) do
        changeset
        |> RelationalAdapter.Luxor.Repository.insert!
        |> load_deps
    end

    def update(changeset) do
        changeset
        |> RelationalAdapter.Luxor.Repository.update!
        |> load_deps
    end

    def delete(changeset) do
        changeset
        |> RelationalAdapter.Luxor.Repository.delete!
        |> load_deps
    end

    def get(id) do
        RelationalAdapter.Luxor.Animal
        |> RelationalAdapter.Luxor.Repository.get!(id)
        |> load_deps
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.Animal, select: w, preload: [:producer]
        RelationalAdapter.Luxor.Repository.all(query)
    end

    defp load_deps(changeset = %RelationalAdapter.Luxor.Animal{}) do
        changeset
        |> RelationalAdapter.Luxor.Repository.preload(:producer)
    end
end
