# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_channel,
  ecto_repos: [TestChannel.Repo]

# Configures the endpoint
config :test_channel, TestChannelWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1Q7UIjE0B+gdV1GTylp04Y9iy3Yq8oVICSeBDDDXxYPwmk+IQHdFcXyvDhU4fB1p",
  render_errors: [view: TestChannelWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TestChannel.PubSub,
  live_view: [signing_salt: "tnplBTXU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
