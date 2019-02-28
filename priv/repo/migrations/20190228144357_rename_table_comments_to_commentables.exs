defmodule LaPotiniere.Repo.Migrations.RenameTableCommentsToCommentables do
  use Ecto.Migration

  def change do
    rename table(:comments), to: table(:commentables)
  end
end
