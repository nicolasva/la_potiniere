defmodule LaPotiniere.Repo.Migrations.AddColumnPositionToContents do
  use Ecto.Migration

  def change do
    alter table(:contents) do
      add :position, :integer, null: false, default: 0
    end
  end
end
