defmodule LaPotiniere.Repo.Migrations.CreateTableUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string, null: false
      add :encrypted_password, :string
      timestamps()
    end
    create unique_index(:users, [:username])
  end
end
