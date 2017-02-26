defmodule RelationalAdapter.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(RelationalAdapter.Luxor.Repository, []),
            worker(RelationalAdapter.Luxor.RepoPersistenceAdapter, [[], [name: :repo_persistence_adapter]]),
            worker(RelationalAdapter.Luxor.UserPersistenceAdapter, [[], [name: :user_persistence_adapter]])
        ]
        opts = [name: RelationalAdapter.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
end
