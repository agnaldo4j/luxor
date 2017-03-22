defmodule RelationalAdapter.Luxor.AnimalRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset) |>
        load_deps
    end

    def update(changeset) do
        RelationalAdapter.Luxor.Repository.update!(changeset) |>
        load_deps
    end

    def delete(changeset) do
      RelationalAdapter.Luxor.Repository.delete!(changeset) |>
      load_deps
    end

    def get(id) do
      RelationalAdapter.Luxor.Repository.get!(RelationalAdapter.Luxor.Animal, id) |>
      load_deps
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.Animal, select: w, preload: [:producer]
        RelationalAdapter.Luxor.Repository.all(query)
    end

    defp load_deps(changeset = %RelationalAdapter.Luxor.Animal{}) do
        changeset |>
        RelationalAdapter.Luxor.Repository.preload(:producer)
    end
end
