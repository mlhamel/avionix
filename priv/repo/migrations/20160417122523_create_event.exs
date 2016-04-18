defmodule Avionix.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :speed, :integer
      add :flight, :string
      add :track, :string
      add :latitude, :integer
      add :longitude, :integer

      timestamps
    end

  end
end
