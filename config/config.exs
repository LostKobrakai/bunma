# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :bunma,
  ecto_repos: [Bunma.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :bunma, BunmaWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: BunmaWeb.ErrorHTML, json: BunmaWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Bunma.PubSub,
  live_view: [signing_salt: "X0AWaDZi"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :bunma, Bunma.Mailer, adapter: Swoosh.Adapters.Local

# Configure bun (the version is required)
config :bun,
  version: "1.0.21",
  default: [
    args:
      ~w(build js/app.js --outdir=../priv/static/assets --external /fonts/* --external /images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
