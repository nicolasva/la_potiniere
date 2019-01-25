defmodule LaPotiniere.Repo.Migrations.AddColumnMenuIdToPhotos do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      add :menu_id, references(:photos)
    end
    create index(:photos, [:menu_id], unique: false)
  end
end
