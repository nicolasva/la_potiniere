defmodule LaPotiniere.Repo.Migrations.AddIndexMasters do
  use Ecto.Migration

  def change do
    create index(:masters, [:content_id], unique: true)
    create index(:masters, [:event_id], unique: true)
    create index(:masters, [:picture_id], unique: true)
  end
end
