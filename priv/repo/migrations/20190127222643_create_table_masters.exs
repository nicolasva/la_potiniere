defmodule LaPotiniere.Repo.Migrations.CreateTableMasters do
  use Ecto.Migration

  def change do
    create table(:masters) do
      add :master_checked?, :boolean, null: false, default: false
      add :assoc_id, :integer, null: false
      timestamps()
    end

    create unique_index(:masters, [:assoc_id])
  end
end
