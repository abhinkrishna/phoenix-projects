# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blogger,
  ecto_repos: [Blogger.Repo]

# Configures the endpoint
config :blogger, BloggerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MuBjHMWkT7c3Lp6Ccre5vmsP0K5VJjq/tkFgXXODjXYPe7WaKemZKTHG3rRwLjZf",
  render_errors: [view: BloggerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Blogger.PubSub,
  live_view: [signing_salt: "Or2QrXXu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
