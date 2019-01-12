defmodule LaPotiniereWeb.MenuController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.Menus
  alias LaPotiniere.Menus.Menu

  def index(conn, _params) do
    menus = Menus.list_menus()
    render(conn, "index.html", menus: menus)
  end

  def new(conn, _params) do
    changeset = Menus.change_menu(%Menu{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"menu" => menu_params}) do
    case Menus.create_menu(menu_params) do
      {:ok, menu} ->
        conn
        |> put_flash(:info, "Menu created successfully.")
        |> redirect(to: Routes.menu_path(conn, :show, menu))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    menu = Menus.get_menu!(id)
    render(conn, "show.html", menu: menu)
  end

  def edit(conn, %{"id" => id}) do
    menu = Menus.get_menu!(id)
    changeset = Menus.change_menu(menu)
    render(conn, "edit.html", menu: menu, changeset: changeset)
  end

  def update(conn, %{"id" => id, "menu" => menu_params}) do
    menu = Menus.get_menu!(id)

    case Menus.update_menu(menu, menu_params) do
      {:ok, menu} ->
        conn
        |> put_flash(:info, "Menu updated successfully.")
        |> redirect(to: Routes.menu_path(conn, :show, menu))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", menu: menu, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    menu = Menus.get_menu!(id)
    {:ok, _menu} = Menus.delete_menu(menu)

    conn
    |> put_flash(:info, "Menu deleted successfully.")
    |> redirect(to: Routes.menu_path(conn, :index))
  end
end
