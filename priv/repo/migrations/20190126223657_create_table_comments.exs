defmodule LaPotiniere.Repo.Migrations.CreateTableComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :title, :string, null: false
      add :comment_text, :text, null: false
      add :rating_director, :integer, null: false, default: 0
      add :event_id, references(:events)
      timestamps()
    end

    create index(:comments, [:event_id], unique: false)
  end
end
