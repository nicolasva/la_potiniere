defmodule LaPotiniere.Repo.Migrations.CreateTableMenus do
  use Ecto.Migration

  def change do
    create table(:menus) do
      add :title, :string
      timestamps()
    end
  end
end
