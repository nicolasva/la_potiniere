defmodule LaPotiniere.Repo.Migrations.DropTableContentsMasters do
  use Ecto.Migration

  def change do
    drop table("contents_masters")
  end
end
