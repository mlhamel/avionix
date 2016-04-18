defmodule Avionix.Event do
  use Avionix.Web, :model

  schema "events" do
    field :speed, :integer
    field :flight, :string
    field :track, :string
    field :latitude, :integer
    field :longitude, :integer

    timestamps
  end

  @required_fields ~w(speed flight track latitude longitude)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_inclusion(:latitude, -90..90)
    |> validate_inclusion(:latitude, -180..180)
  end
end
