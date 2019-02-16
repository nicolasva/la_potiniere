defmodule LaPotiniereWeb.AdminPotiniereWeb.SortController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller

  alias LaPotiniere.{
    Menus,
    Contents,
    Events,
    Photos
  }

  alias LaPotiniere.Menus.Menu
  alias LaPotiniere.Contents.Content
  alias LaPotiniere.Events.Event
  alias LaPotiniere.Photos.Photo

  plug :authenticate when action in [:index]

  def index(conn, _params) do
    if _params["menus"], do: Menus.position(_params["menus"])
    render(conn, "index.json", results: "true")
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
