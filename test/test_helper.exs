ExUnit.start

Mix.Task.run "ecto.create", ~w(-r KWYE.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r KWYE.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(KWYE.Repo)

