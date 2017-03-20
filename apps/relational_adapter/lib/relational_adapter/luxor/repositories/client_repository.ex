defmodule RelationalAdapter.Luxor.ClientRepository do
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
      RelationalAdapter.Luxor.Repository.get!(RelationalAdapter.Luxor.Client, id)
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.Client, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
