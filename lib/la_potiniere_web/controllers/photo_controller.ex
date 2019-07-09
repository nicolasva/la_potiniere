defmodule LaPotiniereWeb.PhotoController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.Photos.Photo

  alias LaPotiniere.{
    Photos,
  }

  def index(conn, %{"menu_id" => menu_id}) do
    menu = LaPotiniereWeb.Menus.get_menu!(menu_id)
    photos = Photos.list_photos(menu)
    render(conn, "index.html", photos: photos, menu: menu)
  end
end
