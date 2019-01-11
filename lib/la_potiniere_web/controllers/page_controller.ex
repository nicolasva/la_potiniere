defmodule LaPotiniereWeb.PageController do
  use LaPotiniereWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
