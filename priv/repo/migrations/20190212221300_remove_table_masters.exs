defmodule LaPotiniere.Repo.Migrations.RemoveTableMasters do
  use Ecto.Migration

  def change do
    drop table(:masters)
    drop table(:contents_masters)
  end
end
