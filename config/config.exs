# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :philter, Philter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U5kxuvRI2WjsFkIaEC9lZ+U11o7pUVT2MluYC9qGk8AHzbMT46xPF6pF/cUulsP3",
  render_errors: [view: Philter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Philter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_twilio,
  account_sid: System.get_env("TWILIO_ACCOUNT_SID"),
  auth_token: System.get_env("TWILIO_AUTH_TOKEN")
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
