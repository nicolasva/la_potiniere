defmodule LaPotiniereWeb.AdminPotiniereWeb.EventController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller
  
  alias LaPotiniere.{
    Events,
    Menus
  }
  alias LaPotiniere.Events.Event
  plug :authenticate when action in [:index, :new, :create, :edit, :update, :delete]

  def index(conn, %{"menu_id" => menu_id}) do
    menu = LaPotiniere.Menus.get_menu!(menu_id)
    events = Events.list_events(menu)
    render(conn, "index.html", events: events, menu: menu)
  end

  def new(conn, %{"menu_id" => menu_id}) do
    changeset = Events.change_event(%Event{}, menu_id)
    render(conn, "new.html", changeset: changeset, menu_id: menu_id)
  end

  def create(conn, %{"event" => event_params, "menu_id" => menu_id}) do
    case Events.create_event(Menus.get_menu!(menu_id), event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Cette évènement a bien été crée.")
        |> redirect(to: Routes.admin_menu_event_path(conn, :index, menu_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, menu_id: menu_id)
    end
  end

  def edit(conn, %{"menu_id" => menu_id, "id" => id}) do
    event = Events.get_event!(id)
    changeset = Events.change_event(event, menu_id)
    render(conn, "edit.html", event: event, changeset: changeset, menu_id: menu_id)

  end

  def update(conn, %{"menu_id" => menu_id, "id" => id, "event" => event_params}) do
    event = Events.get_event!(id)

    case Events.update_event(event, event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Cet évènement a bien été mise à jour.")
        |> redirect(to: Routes.admin_menu_event_path(conn, :index, menu_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event: event, changeset: changeset, menu_id: menu_id)
    end
  end

  def delete(conn, %{"menu_id" => menu_id, "id" => id}) do
    event = Events.get_event!(id)
    {:ok, _event} = Events.delete_event(event)

    conn
    |> put_flash(:info, "Cet évènement a bien été supprimé.")
    |> redirect(to: Routes.admin_menu_event_path(conn, :index, menu_id))
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user && LaPotiniere.Roles.is_admin?(LaPotiniere.Repo.preload(conn.assigns.current_user, :roles).roles) do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
