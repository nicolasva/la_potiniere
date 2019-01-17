defmodule LaPotiniereWeb.AdminPotiniereWeb.MenuController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller
  
  alias LaPotiniere.Menus
  alias LaPotiniere.Menus.Menu

  plug :authenticate when action in [:index, :new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    menus = Menus.list_menus()
    render(conn, "index.html", menus: menus)
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
