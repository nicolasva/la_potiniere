defmodule LaPotiniere.Repo.Migrations.AddColumnPositionToMenus do
  use Ecto.Migration

  def change do
    alter table(:menus) do
      add :position, :integer, null: false, default: 0
    end
  end
end
