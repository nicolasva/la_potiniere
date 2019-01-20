defmodule LaPotiniere.Repo.Migrations.CreateTableCkeditorFile do
  use Ecto.Migration

  def change do
    create table(:ckeditor_files) do
      add :file, :string, null: false
      timestamps()
    end
  end
end
