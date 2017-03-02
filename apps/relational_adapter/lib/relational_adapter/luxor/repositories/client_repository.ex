defmodule RelationalAdapter.Luxor.ClientRepository do
    import Ecto.Query

    def save(client = %RelationalAdapter.Luxor.Client{}) do
        RelationalAdapter.Luxor.Repository.insert!(client)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Luxor.Client, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
