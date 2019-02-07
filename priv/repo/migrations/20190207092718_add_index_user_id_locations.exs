defmodule LaPotiniere.Repo.Migrations.AddIndexUserIdLocations do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      modify :user_id, references(:users, on_delete: :nothing)
    end
  end
end
