use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :k_w_y_e, KWYE.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :k_w_y_e, KWYE.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "kwye_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox


config :k_w_y_e,
  ndb_api_report_cache_size: 50,
  ndb_api_search_cache_size: 50


if File.exists?("config/test.secret.exs") do
   import_config "test.secret.exs"
else
   config :k_w_y_e, ndb_key: System.get_env("NDB_KEY")
end