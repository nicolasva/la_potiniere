defmodule IpapyWeb.Repo.Migrations.CreateTableEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string, null: false
      add :comment, :text, null: false
      add :menu_id, references(:menus)
      timestamps()
    end

    create index(:events, [:menu_id], unique: false)
  end
end
