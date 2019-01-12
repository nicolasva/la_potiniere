defmodule LaPotiniereWeb.AdminPotiniereWeb.PageController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
