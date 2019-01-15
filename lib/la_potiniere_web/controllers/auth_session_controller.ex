defmodule LaPotiniereWeb.AuthSessionController do
  use LaPotiniereWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"auth_session" => %{"username" => user, "password" => pass}}) do
    case LaPotiniereWeb.Service.AuthService.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back !")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username|password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> LaPotiniereWeb.Service.AuthService.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
