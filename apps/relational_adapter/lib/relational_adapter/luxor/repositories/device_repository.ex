defmodule RelationalAdapter.Luxor.DeviceRepository do
    @moduledoc ""

    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def update(changeset) do
        RelationalAdapter.Luxor.Repository.update!(changeset)
    end

    def delete(changeset) do
      RelationalAdapter.Luxor.Repository.delete!(changeset)
    end

    def get(id) do
      RelationalAdapter.Luxor.Repository.get!(RelationalAdapter.Luxor.Device, id)
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.Device, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
