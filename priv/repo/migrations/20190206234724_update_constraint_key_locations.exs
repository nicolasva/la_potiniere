defmodule LaPotiniere.Repo.Migrations.UpdateConstraintKeyLocations do
  use Ecto.Migration

  def change do
    drop(constraint(:locations, "locations_user_id_fkey"))
    alter table(:locations) do
      modify :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
