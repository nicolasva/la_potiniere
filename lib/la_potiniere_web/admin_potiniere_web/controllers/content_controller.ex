defmodule LaPotiniereWeb.AdminPotiniereWeb.ContentController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller
  
  alias LaPotiniere.Contents
  alias LaPotiniere.Contents.Content
  plug :authenticate when action in [:index, :new, :create, :edit, :update, :delete]

  def index(conn, %{"menu_id" => menu_id}) do
    menu = LaPotiniere.Menus.get_menu!(menu_id)
    contents = Contents.list_contents(menu)
    render(conn, "index.html", contents: contents, menu: menu)
  end

  def new(conn, %{"menu_id" => menu_id}) do
    changeset = Contents.change_content(%Content{}, menu_id)
    render(conn, "new.html", changeset: changeset, menu_id: menu_id)
  end

  def create(conn, %{"content" => content_params, "menu_id" => menu_id}) do
    case Contents.create_content(content_params, String.to_integer(menu_id)) do
      {:ok, content} ->
        conn
        |> put_flash(:info, "Ce contenu a bien été crée.")
        |> redirect(to: Routes.admin_menu_content_path(conn, :index, menu_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, menu_id: menu_id)
    end
  end

  def edit(conn, %{"menu_id" => menu_id, "id" => id}) do
    content = Contents.get_content!(id)
    changeset = Contents.change_content(content, conn.assigns.current_user)
    render(conn, "edit.html", content: content, changeset: changeset)

  end

  def update(conn, %{"menu_id" => menu_id, "id" => id, "content" => content_params}) do
    content = Contents.get_content!(id)

    case Contents.update_content(content, content_params) do
      {:ok, content} ->
        conn
        |> put_flash(:info, "Le contenu a bien été mise à jour.")
        |> redirect(to: Routes.admin_menu_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content: content, changeset: changeset)
    end
  end

  def delete(conn, %{"menu_id" => menu_id, "id" => id}) do
    content = Contents.get_content!(id)
    {:ok, _content} = Contents.delete_content(content)

    conn
    |> put_flash(:info, "Ce contenu a bien été supprimé.")
    |> redirect(to: Routes.admin_menu_path(conn, :index))
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
