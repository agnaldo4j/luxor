defmodule Persistence.Luxor.TransporterPersistenceAdapterApi do
    def save(transporter = %Luxor.Transporter{}) do
        GenServer.call(:transporter_persistence_adapter, {:save, transporter}, 15000)
    end

    def update(transporter = %Luxor.Transporter{}) do
      GenServer.call(:transporter_persistence_adapter, {:update, transporter}, 15000)
    end

    def delete(transporter = %Luxor.Transporter{}) do
      GenServer.call(:transporter_persistence_adapter, {:delete, transporter}, 15000)
    end

    def list() do
        GenServer.call(:transporter_persistence_adapter, {:list}, 15000)
    end

    def get(transporter = %Luxor.Transporter{}) do
        GenServer.call(:transporter_persistence_adapter, {:get, transporter}, 15000)
    end
end