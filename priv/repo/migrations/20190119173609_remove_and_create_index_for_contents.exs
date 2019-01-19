defmodule LaPotiniere.Repo.Migrations.RemoveAndCreateIndexForContents do
  use Ecto.Migration

  def change do
    drop index(:contents, [:menu_id])
    create index(:contents, [:menu_id], unique: false)
  end
end
