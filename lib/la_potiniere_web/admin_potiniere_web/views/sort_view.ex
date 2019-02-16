defmodule LaPotiniereWeb.AdminPotiniereWeb.SortView do
  use LaPotiniereWeb.AdminPotiniereWeb, :view

  def render("index.json", %{results: results}) do
    %{results: results}
  end
end
