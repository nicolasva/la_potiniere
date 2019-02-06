defmodule LaPotiniere.Repo.Migrations.UpdateMenusConstraint do
  use Ecto.Migration

  def change do
    drop(constraint(:menus, "menus_user_id_fkey"))
  end
end
