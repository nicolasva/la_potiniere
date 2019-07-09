defmodule LaPotiniereWeb.ContentController do
  use LaPotiniereWeb, :controller

  alias LaPotiniereWeb.Contents.Content

  alias LaPotiniere.{
    Contents,
  }

  def index(conn, %{"menu_id" => menu_id}) do
    menu = LaPotiniereWeb.Menus.get_menu!(menu_id)
    contents = Contents.list_contents(menu)
    render(conn, "index.html", contents: contents, menu: menu)
  end
end
