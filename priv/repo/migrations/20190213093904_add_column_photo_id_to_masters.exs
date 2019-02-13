defmodule LaPotiniere.Repo.Migrations.AddColumnPhotoIdToMasters do
  use Ecto.Migration

  def change do
    alter table(:masters) do
      add :photo_id, references(:photos, on_delete: :delete_all)
    end
    create unique_index(:masters, [:photo_id], unique: true)
  end
end
