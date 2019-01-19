defmodule LaPotiniere.Repo.Migrations.RenameColumnContentsToCommentForContentsTable do
  use Ecto.Migration

  def change do
    rename table(:contents), :contents, to: :comment
  end
end
