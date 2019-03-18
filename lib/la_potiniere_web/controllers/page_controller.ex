defmodule LaPotiniereWeb.PageController do
  use LaPotiniereWeb, :controller

  alias LaPotiniere.Masters
  alias LaPotiniere.Masters.Master
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
