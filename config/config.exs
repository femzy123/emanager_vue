# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :emanager,
  ecto_repos: [Emanager.Repo]

# Configures the endpoint
config :emanager, EmanagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xxF2E+AF16ZJTLj+/UZMVwmnjzJDFWVrcQCc9XLMr9UO9Ghze/+50vcc4oNkudUR",
  render_errors: [view: EmanagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Emanager.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Pow configurations
config :emanager, :pow,
  user: Emanager.Users.User,
  repo: Emanager.Repo,
  web_module: EmanagerWeb,
  extensions: [PowPersistentSession, PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: EmanagerWeb.Pow.Mailer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
