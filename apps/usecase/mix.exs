defmodule Usecase.Mixfile do
  use Mix.Project

  def project do
    [app: :usecase,
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
            :model,
            :adapter
        ],
        mod: {
            Usecase.App, []
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
        {:model, in_umbrella: true},
        {:adapter, in_umbrella: true},
        {:timex, "~> 3.2.1"},
        {:mochiweb, "~> 2.15", [override: true]},
        {:mochiweb_xpath, github: "retnuh/mochiweb_xpath", tag: "v1.2.0"}
    ]
  end
end
