use Mix.Config

config :blox, Blox.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  cache_static_lookup: true

config :phoenix, :code_reloader, false

config :logger, :console,
  level:  :error,
  format: "[$level] $message\n"

config :blox, Blox.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "blox_dev",
  username: System.get_env("USER")
