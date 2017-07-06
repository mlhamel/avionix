defmodule Avionix.EventView do
  use Avionix.Web, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, Avionix.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, Avionix.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      hex: event.hex,
      altitude: event.altitude,
      speed: event.speed,
      flight: event.flight,
      track: event.track,
      lat: event.lat,
      lon: event.lon}
  end
end
