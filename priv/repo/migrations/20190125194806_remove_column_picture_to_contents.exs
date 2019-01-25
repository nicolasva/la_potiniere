defmodule LaPotiniere.Repo.Migrations.RemoveColumnPictureToContents do
  use Ecto.Migration

  def change do
    alter table("contents") do
      remove :picture?
    end
  end
end
