defmodule LaPotiniere.Repo.Migrations.AddColumnPositionToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :position, :integer, null: false, default: 0
    end
  end
end
