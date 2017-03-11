defmodule RelationalAdapter.Luxor.TransporterRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Luxor.Transporter, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
