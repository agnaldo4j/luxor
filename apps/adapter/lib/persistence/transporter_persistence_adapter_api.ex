defmodule Persistence.Luxor.TransporterPersistenceAdapterApi do
    @moduledoc ""

    def save(transporter = %Luxor.Transporter{}) do
        GenServer.call(:transporter_persistence_adapter, {:save, transporter}, 15_000)
    end

    def update(transporter = %Luxor.Transporter{}) do
      GenServer.call(:transporter_persistence_adapter, {:update, transporter}, 15_000)
    end

    def delete(transporter = %Luxor.Transporter{}) do
      GenServer.call(:transporter_persistence_adapter, {:delete, transporter}, 15_000)
    end

    def list() do
        GenServer.call(:transporter_persistence_adapter, {:list}, 15_000)
    end

    def get(transporter = %Luxor.Transporter{}) do
        GenServer.call(:transporter_persistence_adapter, {:get, transporter}, 15_000)
    end
end