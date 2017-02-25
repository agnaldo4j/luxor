defmodule RelationalAdapter.Kaizen.UserRepository do
    import Ecto.Query

    def save(github_repository = %RelationalAdapter.Kaizen.User{}) do
        RelationalAdapter.Kaizen.Repository.insert!(github_repository)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Kaizen.User, select: w
        RelationalAdapter.Kaizen.Repository.all(query)
    end
end
