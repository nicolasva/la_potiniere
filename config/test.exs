use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :la_potiniere, LaPotiniereWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :la_potiniere, LaPotiniere.Repo,
  username: "phoenix",
  password: "infonies",
  database: "la_potiniere_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
