defmodule LaPotiniere.Repo.Migrations.ChangeAttributesColumnPictureToPhotos do
  use Ecto.Migration

  def change do
    alter table(:menus) do
      remove :picture?
      #modify :picture?, :integer, null: false, default: 0
      add :picture?, :integer, null: false, default: 0
    end
  end
end
