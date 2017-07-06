defmodule Avionix.Event do
  use Avionix.Web, :model

  schema "events" do
    field :hex, :string
    field :flight, :string
    field :lat, :float
    field :lon, :float
    field :altitude, :integer
    field :track, :integer
    field :speed, :integer

    timestamps
  end

  @derive [Poison.Encoder]
  @required_fields ~w(hex flight lat lon altitude track speed)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> update_change(:flight, &String.strip/1)
  end
end
