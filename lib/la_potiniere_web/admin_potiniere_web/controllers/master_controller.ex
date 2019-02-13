defmodule LaPotiniereWeb.AdminPotiniereWeb.MasterController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller

  alias LaPotiniere.{
    Contents,
    Events,
    Photos,
    Masters
  }

  alias LaPotiniere.Masters.Master

  def index(conn, _params) do
    if _params["content_id"] do
      changeset = Contents.get_content!(_params["content_id"])
    end

    if _params["event_id"] do
      changeset = Events.get_event!(_params["event_id"])
    end

    if _params["photo_id"] do
      changeset = Photos.get_photo!(_params["photo_id"])
    end

    Masters.create_master(changeset)
    if _params["content_id"] do
      redirect(conn, to: Routes.admin_menu_content_path(conn, :index, _params["menu_id"]))
    end

    if _params["event_id"] do
      redirect(conn, to: Routes.admin_menu_event_path(conn, :index, _params["menu_id"]))
    end

    if _params["photo_id"] do
      redirect(conn, to: Routes.admin_menu_photo_path(conn, :index, _params["menu_id"]))
    end
      #{:ok, master} ->
        #  conn
        #|> put_flash(:info, "Cette page à bien été enregistré comme page par défaut")
        #|> redirect(to: Routes.admin_menu_content_path(conn, :index, menu_id))
      #{:error, %Ecto.Changeset{} = changeset} ->
        #  render(conn, 
      #end
  end
end
