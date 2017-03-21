defmodule RelationalAdapter.Luxor.ClientUserRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def update(changeset) do
        RelationalAdapter.Luxor.Repository.update!(changeset)
    end

    def get(id) do
      RelationalAdapter.Luxor.Repository.get!(RelationalAdapter.Luxor.ClientUser, id) |>
      RelationalAdapter.Luxor.Repository.preload(:client) |>
      RelationalAdapter.Luxor.Repository.preload(:user)
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.ClientUser, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
