# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config


config :la_potiniere,
  ecto_repos: [LaPotiniere.Repo]

config :la_potiniere, LaPotiniereWeb.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 465,
  username: "nicolas.vandenbogaerde@gmail.com",
  password: "nic0lasva",
  ssl: true,
  retries: 1

config :arc,
  storage: Arc.Storage.Local

# Configures the endpoint
config :la_potiniere, LaPotiniereWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V1ozsoc2I07rONZhDYz8p4NscHtK8ZGMUmyiW0T+nDdfNCSc3Zxy8YR/R4oLaEF2",
  render_errors: [view: LaPotiniereWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LaPotiniere.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
