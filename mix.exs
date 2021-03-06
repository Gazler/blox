defmodule Blox.Mixfile do
  use Mix.Project

  def project do
    [
      app: :blox,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: ["lib", "web"],
      compilers: [:phoenix] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [
      mod: {Blox, []},
      applications: [:phoenix, :cowboy, :logger, :phoenix_ecto]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 0.13.0"},
      {:cowboy, "~> 1.0"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 0.12.0"},
      {:phoenix_ecto, "~> 0.5"},
      {:phoenix_live_reload, "~> 0.4"},
      {:phoenix_html, "~> 1.0"},
      {:ex_spec, "~> 0.3.0", only: :test}
    ]
  end
end
