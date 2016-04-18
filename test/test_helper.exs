ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Avionix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Avionix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Avionix.Repo)

