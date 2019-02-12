defmodule LaPotiniere.Repo.Migrations.CreateTableContentsMasters2 do
  use Ecto.Migration

  def change do
    create table(:contents_masters) do
      add :assoc_id, references(:masters, on_delete: :delete_all)
      add :parent_id, references(:contents, on_delete: :delete_all)
      timestamps()
    end
  end
end
