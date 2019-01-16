defmodule LaPotiniereWeb.AdminPotiniereWeb.PageController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller

  plug :authenticate when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
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
