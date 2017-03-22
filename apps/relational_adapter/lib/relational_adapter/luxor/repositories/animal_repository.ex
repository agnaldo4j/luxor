defmodule RelationalAdapter.Luxor.AnimalRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def update(changeset) do
        RelationalAdapter.Luxor.Repository.update!(changeset)
    end

    def delete(changeset) do
      RelationalAdapter.Luxor.Repository.delete!(changeset)
    end

    def get(id) do
      RelationalAdapter.Luxor.Repository.get!(RelationalAdapter.Luxor.Animal, id)
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.Animal, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
