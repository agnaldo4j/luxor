defmodule Profitability.Mixfile do
  use Mix.Project

  def project do
    [
        test_coverage: [tool: Coverex.Task, coveralls: true],
        apps_path: "apps",
        build_embedded: Mix.env == :prod,
        start_permanent: Mix.env == :prod,
        deps: deps()
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
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
        {:credo, "~> 0.8.10", only: [:dev, :test]},
        {:inch_ex, "~> 0.5.6", only: [:dev, :test]},
        {:coverex, "~> 1.4.15", only: :test}
    ]
  end
end
