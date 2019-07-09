defmodule LaPotiniereWeb.MenuView do
  use LaPotiniereWeb, :view

  def path_routes(menu, conn) do
    if menu.picture? == 2, do: Routes.menu_event_path(conn, :index, menu)
    if menu.picture? == 1, do: Routes.menu_photo_path(conn, :index, menu)
    if menu.picture? == 0, do: Routes.menu_content_path(conn, :index, menu)
  end
end
