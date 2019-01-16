defmodule LaPotiniere.Repo.Migrations.CreateTableRolesUsers do
  use Ecto.Migration

  def change do
    create table(:roles_users) do
      add :role_id, references(:roles)
      add :user_id, references(:users)
    end

    create unique_index(:roles_users, [:role_id])
    create unique_index(:roles_users, [:user_id])
  end
end
