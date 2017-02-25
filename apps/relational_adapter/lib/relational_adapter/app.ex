defmodule RelationalAdapter.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(RelationalAdapter.Kaizen.Repository, []),
            worker(RelationalAdapter.Kaizen.RepoPersistenceAdapter, [[], [name: :repo_persistence_adapter]]),
            worker(RelationalAdapter.Kaizen.UserPersistenceAdapter, [[], [name: :user_persistence_adapter]])
        ]
        opts = [name: RelationalAdapter.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
end
