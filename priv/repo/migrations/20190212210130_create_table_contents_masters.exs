defmodule LaPotiniere.Repo.Migrations.CreateTableContentsMasters do
  use Ecto.Migration

  def change do
    create table(:contents_masters) do
      add :assoc_id, references(:masters, on_delete: :nothing)
      add :parent_id, references(:contents_masters, on_delete: :nothing)
      timestamps()
    end

    create index(:contents_masters, [:assoc_id])
  end
end
