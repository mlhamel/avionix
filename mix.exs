defmodule Avionix.Mixfile do
  use Mix.Project

  def project do
    [app: :avionix,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps,
     preferred_cli_env: [
       vcr: :test,
       "vcr.delete": :test,
       "vcr.check": :test,
       "vcr.show": :test
     ]]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Avionix, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :sqlite_ecto, :httpoison,
                    :ex1090]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.1.4"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_ecto, "~> 2.0"},
     {:phoenix_html, "~> 2.4"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.9"},
     {:cowboy, "~> 1.0"},
     {:sqlite_ecto, "~> 1.0.0"},
     {:httpoison, "~> 0.8.0"},
     {:poison, "~> 1.5.2"},
     {:exrm, "~> 1.0.3"},
     {:ex1090, github: "mlhamel/ex1090"},
     {:exvcr, "~> 0.7", only: :test}]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
