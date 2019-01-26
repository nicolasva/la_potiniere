defmodule LaPotiniereWeb.AdminPotiniereWeb.PhotoController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller
  
  alias LaPotiniere.Photos
  alias LaPotiniere.Photos.Photo

  plug :authenticate when action in [:index, :new, :create, :edit, :update, :delete]

  def index(conn, %{"menu_id" => menu_id}) do
    menu = LaPotiniere.Menus.get_menu!(menu_id)
    photos = Photos.list_photos(menu)
    render(conn, "index.html", menu: menu, photos: photos)
  end

  def new(conn, %{"menu_id" => menu_id}) do
    changeset = Photos.change_photo(%Photo{}, menu_id)
    render(conn, "new.html", changeset: changeset, menu_id: menu_id)
  end

  def create(conn, %{"menu_id" => menu_id, "photo" => photo_params}) do
    case Photos.create_photo(photo_params, String.to_integer(menu_id)) do
      {:ok, photo} ->
        conn
        |> put_flash(:info, "Cette photo a bien été enregistrée.")
        |> redirect(to: Routes.admin_menu_photo_path(conn, :index, menu_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, menu_id: menu_id)
    end
  end

  def edit(conn, %{"menu_id" => menu_id, "id" => id}) do
    photo = Photos.get_photo!(id)
    changeset = Photos.change_photo(photo, menu_id)
    render(conn, "edit.html", photo: photo, changeset: changeset, menu_id: menu_id)
  end

  def update(conn, %{"menu_id" => menu_id, "id" => id, "photo" => photo_params}) do
    photo = Photos.get_photo!(id)

    case Photos.update_photo(photo, photo_params) do
      {:ok, photo} ->
        conn
        |> put_flash(:info, "Cette photo a bien été mise à jour.")
        |> redirect(to: Routes.admin_menu_photo_path(conn, :index, menu_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", menu_id: menu_id, photo: photo, changeset: changeset)
    end
  end

  def delete(conn, %{"menu_id" => menu_id, "id" => id}) do
    photo = Photos.get_photo!(id)
    {:ok, _menu} = Photos.delete_photo(photo)

    conn
    |> put_flash(:info, "Cette photo a bien été supprimé.")
    |> redirect(to: Routes.admin_menu_photo_path(conn, :index, menu_id))
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
