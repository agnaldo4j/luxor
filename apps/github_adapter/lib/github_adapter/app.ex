defmodule GithubAdapter.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(Kaizen.GithubAdapter, [[], [name: :github_adapter]]),
        ]
        opts = [name: GithubAdapter.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
end
