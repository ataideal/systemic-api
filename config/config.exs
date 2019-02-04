# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :systemic_socket,
  ecto_repos: [SystemicSocket.Repo]

# Configures the endpoint
config :systemic_socket, SystemicSocketWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2tK8OR7OpCZx26VU8PmvY0CNegSIbPiVfC8sNzujPcWFGizaxzVW7tu3H3KwJP+a",
  render_errors: [view: SystemicSocketWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SystemicSocket.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
