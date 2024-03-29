defmodule RestApi.Mixfile do
  use Mix.Project

  def project do
    [app: :rest_api,
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
            :corsica,
            :cowboy,
            :plug,
            :timex,
            :poison,
            :joken,
            :mochiweb_xpath,
            :adapter,
            :model
        ],
        mod: {RestApi, []}
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
  # Type "mix help deps" for more examples and options
  defp deps do
    [
        #{:cf, "~> 0.2.1", override: true},
        #{:erlware_commons, github: "erlware/erlware_commons", override: true},
        #{:combine, github: "bitwalker/combine", override: true},
        #{:relx, github: "erlware/relx", override: true},
        {:cowboy, "~> 1.0.1"},
        {:plug, "~> 1.4.5"},
        {:corsica, "~> 1.1.1"},
        {:joken, "~> 1.5.0"},
        {:distillery, "~> 1.5", runtime: false},
        {:model, in_umbrella: true},
        {:adapter, in_umbrella: true}
    ]
  end
end
