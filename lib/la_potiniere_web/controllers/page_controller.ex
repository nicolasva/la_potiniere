defmodule LaPotiniereWeb.PageController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.Masters
  alias LaPotiniere.Masters.Master
  def index(conn, _params) do
    menu = Masters.menu_master |> LaPotiniere.Repo.preload([:contents, :photos, :events])

    render(conn, "index.html", menu: menu)
  end
end
