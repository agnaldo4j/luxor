defmodule RelationalAdapter.Luxor.ClientUserRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.ClientUser, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
