ExUnit.start

Mix.Task.run "ecto.create", ~w(-r AuthDemo.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r AuthDemo.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(AuthDemo.Repo)

