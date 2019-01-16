defmodule LaPotiniere.Repo.Migrations.RemoveUniqueIndexToRolesUsers do
  use Ecto.Migration

  def change do
    drop index(:roles_users, [:role_id])
    drop index(:roles_users, [:user_id])
  end
end
