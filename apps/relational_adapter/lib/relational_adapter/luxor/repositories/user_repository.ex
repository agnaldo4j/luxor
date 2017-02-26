defmodule RelationalAdapter.Luxor.UserRepository do
    import Ecto.Query

    def save(github_repository = %RelationalAdapter.Luxor.User{}) do
        RelationalAdapter.Luxor.Repository.insert!(github_repository)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Luxor.User, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
