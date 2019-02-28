defmodule LaPotiniereWeb.EventController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.Commentables.Commentable
  alias LaPotiniere.{
    Events,
    Commentables,
  }

  def index(conn, %{"menu_id" => menu_id}) do
    menu = LaPotiniere.Menus.get_menu!(menu_id)
    events = Events.list_events(menu)
    render(conn, "index.html", events: events, menu: menu)
  end

  def show(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    changeset = Commentables.change_commentable(%Commentable{}, event.id)
    render(conn, "show.html", event: event, menu: event.menu, changeset: changeset)
  end
end
