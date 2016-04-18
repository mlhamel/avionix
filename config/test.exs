use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :avionix, Avionix.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :avionix, Avionix.Repo,
  adapter: Sqlite.Ecto,
  database: "avionix_test.sqlite3",
  pool: Ecto.Adapters.SQL.Sandbox
