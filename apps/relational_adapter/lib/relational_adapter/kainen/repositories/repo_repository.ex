defmodule RelationalAdapter.Kaizen.RepoRepository do
    import Ecto.Query

    def save(github_repository = %RelationalAdapter.Kaizen.Repo{}) do
        RelationalAdapter.Kaizen.Repository.insert!(github_repository)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Kaizen.Repo, select: w
        RelationalAdapter.Kaizen.Repository.all(query)
    end
end
