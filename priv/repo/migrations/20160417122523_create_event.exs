defmodule Avionix.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :hex, :string
      add :flight, :string
      add :lat, :float
      add :lon, :float
      add :altitude, :integer
      add :track, :integer
      add :speed, :integer

      timestamps
    end

  end
end
