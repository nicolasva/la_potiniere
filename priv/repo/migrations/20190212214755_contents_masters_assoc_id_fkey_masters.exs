defmodule LaPotiniere.Repo.Migrations.ContentsMastersAssocIdFkeyMasters do
  use Ecto.Migration

  def change do
    drop(constraint(:contents_masters, "contents_masters_assoc_id_fkey"))
  end
end
