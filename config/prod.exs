use Mix.Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :challenge_gov, Web.Endpoint,
  http: [:inet4, port: System.get_env("PORT") || 4000],
  url: [host: System.get_env("HOST"), scheme: "https", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :challenge_gov, ChallengeGov.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "15")

# Do not print debug messages in production
config :logger, level: :info

# ## Using releases (distillery)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :challenge_gov, Web.Endpoint, server: true
#
# Note you can't rely on `System.get_env/1` when using releases.
# See the releases documentation accordingly.

config :challenge_gov, :recaptcha,
  module: ChallengeGov.Recaptcha.Implementation,
  secret_key: {:system, "RECAPTCHA_SECRET_KEY"},
  key: {:system, "RECAPTCHA_SITE_KEY"}

config :challenge_gov, ChallengeGov.Mailer,
  from: {:system, "MAILER_FROM_ADDRESS"},
  adapter: Bamboo.MailgunAdapter,
  api_key: {:system, "MAILGUN_API_KEY"},
  domain: {:system, "MAILGUN_DOMAIN"}

config :stein_storage,
  backend: :s3,
  bucket: {:system, "BUCKET_NAME"}

config :ex_aws,
  region: "us-gov-west-1",
  access_key_id: {:system, "AWS_ACCESS_KEY_ID"},
  secret_access_key: {:system, "AWS_SECRET_ACCESS_KEY"}

config :challenge_gov, :oidc_config, %{
  idp_authorize_url: "https://idp.int.identitysandbox.gov/openid_connect/authorize",
  acr_value: "http://idmanagement.gov/ns/assurance/loa/1",
  redirect_uri: "https://challenge-portal-dev.app.cloud.gov/auth/result",
  client_id: "urn:gov:gsa:openidconnect.profiles:sp:sso:gsa:challenge_test_app",
  private_key_path: "private.pem",
  public_key_path: "cert.pem"
}

if File.exists?("config/prod.secret.exs") do
  import_config "prod.secret.exs"
end
