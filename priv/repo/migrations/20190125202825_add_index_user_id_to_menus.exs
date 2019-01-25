defmodule LaPotiniere.Repo.Migrations.AddIndexUserIdToMenus do
  use Ecto.Migration

  def change do
    create index(:menus, [:user_id], unique: false)
  end
end
