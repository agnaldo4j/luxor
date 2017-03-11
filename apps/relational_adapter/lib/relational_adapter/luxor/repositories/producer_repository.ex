defmodule RelationalAdapter.Luxor.ProducerRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Luxor.Producer, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
