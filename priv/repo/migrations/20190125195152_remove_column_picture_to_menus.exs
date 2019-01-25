defmodule LaPotiniere.Repo.Migrations.RemoveColumnPictureToMenus do
  use Ecto.Migration

  def change do
    alter table("menus") do
      add :picture?, :boolean, null: false, default: false
    end
  end
end
