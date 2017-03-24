defmodule Persistence.Luxor.AnalysisPersistenceAdapterApi do
    def save(analysis = %Luxor.Analysis{}) do
        GenServer.call(:analysis_persistence_adapter, {:save, analysis}, 15000)
    end

    def update(analysis = %Luxor.Analysis{}) do
      GenServer.call(:analysis_persistence_adapter, {:update, analysis}, 15000)
    end

    def delete(analysis = %Luxor.Analysis{}) do
      GenServer.call(:analysis_persistence_adapter, {:delete, analysis}, 15000)
    end

    def list() do
        GenServer.call(:analysis_persistence_adapter, {:list}, 15000)
    end

    def get(analysis = %Luxor.Analysis{}) do
        GenServer.call(:analysis_persistence_adapter, {:get, analysis}, 15000)
    end
end