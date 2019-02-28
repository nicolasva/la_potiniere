defmodule LaPotiniereWeb.EventController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.{
    Events
  }

  def show(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    render(conn, "show.html", event: event, menu: event.menu)
  end
end
