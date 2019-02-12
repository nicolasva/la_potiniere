defmodule LaPotiniereWeb.AdminPotiniereWeb.MasterController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller

  alias LaPotiniere.{
    Contents,
    Masters
  }

  alias LaPotiniere.Contents.Content
  alias LaPotiniere.Masters.Master

  def index(conn, %{"menu_id" => menu_id, "content_id" => content_id}) do
    if content_id do
      changeset = Contents.get_content!(content_id)
    end
    #Masters.create_master(changeset, %{master_checked?: true})
    redirect(conn, to: Routes.admin_menu_content_path(conn, :index, menu_id))
      #{:ok, master} ->
        #  conn
        #|> put_flash(:info, "Cette page à bien été enregistré comme page par défaut")
        #|> redirect(to: Routes.admin_menu_content_path(conn, :index, menu_id))
      #{:error, %Ecto.Changeset{} = changeset} ->
        #  render(conn, 
      #end
  end
end
