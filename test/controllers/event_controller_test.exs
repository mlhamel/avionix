defmodule Avionix.EventControllerTest do
  use Avionix.ConnCase

  alias Avionix.Event
  @valid_attrs %{flight: "some content", lat: 42, lon: 42, altitude: 100, hex: "11", speed: 42, track: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, event_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = get conn, event_path(conn, :show, event)
    assert json_response(conn, 200)["data"] == %{
      "id" => event.id,
      "hex" => event.hex,
      "altitude" => event.altitude,
      "speed" => event.speed,
      "flight" => event.flight,
      "track" => event.track,
      "lat" => event.lat,
      "lon" => event.lon}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, event_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, event_path(conn, :create), event: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Event, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, event_path(conn, :create), event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = put conn, event_path(conn, :update, event), event: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Event, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = put conn, event_path(conn, :update, event), event: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    event = Repo.insert! %Event{}
    conn = delete conn, event_path(conn, :delete, event)
    assert response(conn, 204)
    refute Repo.get(Event, event.id)
  end
end
