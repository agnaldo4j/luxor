defmodule Persistence.Luxor.AnalysisPersistenceAdapterApi do
    def save(analysis = %Luxor.Analysis{}) do
        GenServer.call(:analysis_persistence_adapter, {:save, analysis})
    end

    def update(analysis = %Luxor.Analysis{}) do
      GenServer.call(:analysis_persistence_adapter, {:update, analysis})
    end

    def delete(analysis = %Luxor.Analysis{}) do
      GenServer.call(:analysis_persistence_adapter, {:delete, analysis})
    end

    def list() do
        GenServer.call(:analysis_persistence_adapter, {:list})
    end

    def get(analysis = %Luxor.Analysis{}) do
        GenServer.call(:analysis_persistence_adapter, {:get, analysis})
    end
end