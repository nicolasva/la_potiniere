defmodule LaPotiniere.Repo.Migrations.CreateTableContents do
  use Ecto.Migration

  def change do
    create table(:contents) do
      add :contents, :string
      add :menu_id, references(:menus)
      timestamps()
    end

    create unique_index(:contents, [:menu_id])
  end
end
