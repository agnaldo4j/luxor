defmodule RelationalAdapter.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(RelationalAdapter.Luxor.Repository, []),
            worker(RelationalAdapter.Luxor.DevicePersistenceAdapter, [[], [name: :device_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.UserPersistenceAdapter, [[], [name: :user_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.ClientPersistenceAdapter, [[], [name: :client_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.ClientUserPersistenceAdapter, [[], [name: :client_user_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.TransporterPersistenceAdapter, [[], [name: :transporter_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.ProducerPersistenceAdapter, [[], [name: :producer_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.AnimalPersistenceAdapter, [[], [name: :animal_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.AnalysisPersistenceAdapter, [[], [name: :analysis_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.TruckPersistenceAdapter, [[], [name: :truck_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.TruckDriverPersistenceAdapter, [[], [name: :truck_driver_persistence_adapter]])
        ]
        opts = [name: RelationalAdapter.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
end
