defmodule LaPotiniere.Repo.Migrations.AddIndexToRolesUsers do
  use Ecto.Migration

  def change do
    create index(:roles_users, [:role_id], unique: false)
    create index(:roles_users, [:user_id], unique: false)
  end
end
