import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :pass_gen, PassGen.Repo,
 username: "ironman",
  password: "nonewhatsoever",
  hostname: "localhost",
  database: "starkdb",
  port: "5431",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pass_gen, PassGenWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Y75zdZsBXNfiVmJaKTi5unYs9pJ22Vtx9gUhwlJ217PcrfhHSb4VAFaF2Tmru4Wo",
  server: false

# In test we don't send emails.
config :pass_gen, PassGen.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
