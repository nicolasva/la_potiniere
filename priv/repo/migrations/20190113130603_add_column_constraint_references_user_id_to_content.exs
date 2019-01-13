defmodule LaPotiniere.Repo.Migrations.AddColumnConstraintReferencesUserIdToContent do
  use Ecto.Migration

  def change do
    alter table(:menus) do
      add :user_id, references(:users)
    end

    create unique_index(:menus, [:user_id])
  end
end
