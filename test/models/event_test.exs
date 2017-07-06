require IEx

defmodule Avionix.EventTest do
  use Avionix.ModelCase

  alias Avionix.Event

  @valid_attrs %{flight: "some content", lat: 45.414322, lon: -73.817923, altitude: 100, hex: "11", speed: 42, track: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    IEx.pry
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
