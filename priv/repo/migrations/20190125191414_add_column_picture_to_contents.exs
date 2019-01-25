defmodule LaPotiniere.Repo.Migrations.AddColumnPictureToContents do
  use Ecto.Migration

  def change do
    alter table("contents") do
      add :picture?, :boolean, null: false, default: false
    end
  end
end
