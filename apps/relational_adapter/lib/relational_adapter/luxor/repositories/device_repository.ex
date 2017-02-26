defmodule RelationalAdapter.Luxor.DeviceRepository do
    import Ecto.Query

    def save(device = %RelationalAdapter.Luxor.Device{}) do
        RelationalAdapter.Luxor.Repository.insert!(device)
    end

    def keyword_query do
        query = from w in RelationalAdapter.Luxor.Device, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
