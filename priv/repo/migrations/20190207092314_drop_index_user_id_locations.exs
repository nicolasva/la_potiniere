defmodule LaPotiniere.Repo.Migrations.DropIndexUserIdLocations do
  use Ecto.Migration

  def change do
    drop(constraint(:locations, "locations_user_id_fkey"))
  end
end
