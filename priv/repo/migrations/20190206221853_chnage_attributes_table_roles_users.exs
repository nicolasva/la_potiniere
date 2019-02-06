defmodule LaPotiniere.Repo.Migrations.ChnageAttributesTableRolesUsers do
  use Ecto.Migration

  def change do
    drop(constraint(:roles_users, "roles_users_role_id_fkey"))
    drop(constraint(:roles_users, "roles_users_user_id_fkey"))
    alter table(:roles_users) do
      modify :role_id, references(:roles, on_delete: :delete_all)
      modify :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
