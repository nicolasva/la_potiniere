defmodule LaPotiniereWeb.AdminPotiniereWeb.UserController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller

  alias LaPotiniere.Users
  alias LaPotiniere.Users.User

  plug :authenticate when action in [:index, :new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.admin_user_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    changeset = Users.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    case Users.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "L'utilisateur a bien été mise à jour.")
        |> redirect(to: Routes.admin_user_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    {:ok, _user} = Users.delete_user(user)

    conn
    |> put_flash(:info, "L'utilisateur a bien été supprimé")
    |> redirect(to: Routes.admin_user_path(conn, :index))
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
