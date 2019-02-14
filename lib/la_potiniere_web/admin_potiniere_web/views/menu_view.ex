defmodule LaPotiniereWeb.AdminPotiniereWeb.MenuView do
  use LaPotiniereWeb.AdminPotiniereWeb, :view

  def is_menu_master(master_menu, current_menu) do
    if master_menu.id == current_menu.id, do: raw("<span class='bg-warning btn-lg'>Par défaut sur la page principal</span>")
  end

  def menu_user(menu) do
    if menu.user, do: "#{menu.user.name} #{menu.user.username}<#{menu.user.email}>"
  end
end
