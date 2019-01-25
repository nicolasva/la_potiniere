defmodule LaPotiniere.Repo.Migrations.AddColumnReferenceToContent do
  use Ecto.Migration

  def change do
    alter table("contents") do
      add :reference, :string, null: true
    end
  end
end
