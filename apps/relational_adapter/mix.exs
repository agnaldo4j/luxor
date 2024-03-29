defmodule RelationalAdapter.Mixfile do
  use Mix.Project

  def project do
    [app: :relational_adapter,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
        applications: [
            :logger,
            :postgrex,
            :ecto,
            :timex,
            :timex_ecto,
            :uuid,
            :adapter
        ],
        mod: {
            RelationalAdapter.App, []
        }
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:myapp, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
        #{:cf, "~> 0.2.1", override: true},
        #{:erlware_commons, github: "erlware/erlware_commons", override: true},
        #{:combine, github: "bitwalker/combine", override: true},
        #{:relx, github: "erlware/relx", override: true},
        {:postgrex, "~> 0.13.5"},
        {:ecto, "~> 2.2.8"},
        {:timex, "~> 3.2.1"},
        {:timex_ecto, "~> 3.2.1"},
        {:uuid, "~> 1.1.8"},
        {:adapter, in_umbrella: true}
    ]
  end
end
