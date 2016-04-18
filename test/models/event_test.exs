defmodule Avionix.EventTest do
  use Avionix.ModelCase

  alias Avionix.Event

  @valid_attrs %{flight: "some content", latitude: 42, longitude: 42, speed: 42, track: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
