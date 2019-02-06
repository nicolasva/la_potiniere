defmodule LaPotiniere.Repo.Migrations.UpdateMenusConstraintUserId do
  use Ecto.Migration

  def change do
    drop(constraint(:menus, "menus_user_id_fkey"))
    alter table(:menus) do
      modify :user_id, references(:users, on_delete: :nothing)
    end
  end
end
