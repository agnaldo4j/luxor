defmodule RelationalAdapter.Luxor.UserRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def delete(changeset = %RelationalAdapter.Luxor.User{}) do
      RelationalAdapter.Luxor.Repository.delete!(changeset)
    end

    def delete(changeset = %RelationalAdapter.Luxor.ClientUser{}) do
      RelationalAdapter.Luxor.Repository.delete!(changeset.user)
      changeset
    end

    def keyword_query do
        query = from w in RelationalAdapter.Luxor.User, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
