# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :twitter,
  ecto_repos: [Twitter.Repo]

# Configures the endpoint
config :twitter, Twitter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B9OYULSZ6hRBhqY0sq+I1EuyrEYDzAzgr2C3OKMeeJ6C5rRgIGQMvmSl3JXvsxja",
  render_errors: [view: Twitter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Twitter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Twitter UeberAuth
config :ueberauth, Ueberauth,
  providers: [
      twitter: {Ueberauth.Strategy.Twitter, []}
      ]

# Configures UeberAuth Strategy
config :ueberauth, Ueberauth.Strategy.Twitter.OAuth,
  consumer_key: "",
    consumer_secret: ""

# Configures ExTwitter for API calls
config :extwitter, :oauth, [
   consumer_key: "",
   consumer_secret: "",
   access_token: "",
   access_token_secret: ""
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
