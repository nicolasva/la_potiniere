defmodule LaPotiniere.Repo.Migrations.CreateTablePictures do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :title, :string
      add :content_id, references(:contents)
      timestamps()
    end

    create unique_index(:pictures, [:content_id])
  end
end
