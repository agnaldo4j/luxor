defmodule RelationalAdapter.Luxor.TruckRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Luxor.Truck, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
