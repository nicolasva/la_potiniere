defmodule LaPotiniere.Repo.Migrations.CreateTableMaster do
  use Ecto.Migration

  def change do
    create table(:masters) do
      add :content_id, references(:contents, on_delete: :delete_all)
      add :picture_id, references(:pictures, on_delete: :delete_all)
      add :event_id, references(:events, on_delete: :delete_all)
      timestamps()
    end
  end
end
