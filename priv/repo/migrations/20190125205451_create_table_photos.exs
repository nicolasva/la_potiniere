defmodule LaPotiniere.Repo.Migrations.CreateTablePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :title, :string, null: true
      add :photo_file, :string, null: false
      add :legend, :text, null: true
      timestamps()
    end
  end
end
