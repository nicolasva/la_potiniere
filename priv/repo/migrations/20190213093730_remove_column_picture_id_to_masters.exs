defmodule LaPotiniere.Repo.Migrations.RemoveColumnPictureIdToMasters do
  use Ecto.Migration

  def change do
    alter table(:masters) do
      remove :picture_id
    end
  end
end
