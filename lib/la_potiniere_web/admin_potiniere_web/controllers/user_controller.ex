defmodule LaPotiniereWeb.AdminPotiniereWeb.UserController do
  use LaPotiniereWeb.AdminPotiniereWeb, :controller

  alias LaPotiniere.Users
  alias LaPotiniere.Users.User

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.html", users: users)
  end

end
