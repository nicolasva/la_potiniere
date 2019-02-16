defmodule LaPotiniere.Repo.Migrations.AddColumnPositionToPhotos do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      add :position, :integer, null: false, default: 0
    end
  end
end
