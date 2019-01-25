defmodule LaPotiniere.Repo.Migrations.RemoveUniqueIndexUserIdToMenus do
  use Ecto.Migration

  def change do
    drop index(:menus, [:user_id])
  end
end
