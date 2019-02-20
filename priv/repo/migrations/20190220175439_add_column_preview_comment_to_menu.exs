defmodule LaPotiniere.Repo.Migrations.AddColumnPreviewCommentToMenu do
  use Ecto.Migration

  def change do
    alter table(:menus) do
      add :preview_comment, :text, null: true
    end
  end
end
