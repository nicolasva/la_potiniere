defmodule LaPotiniere.Repo.Migrations.CreateTableRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :role_value, :integer, null: false, default: 2
      timestamps()
    end
  end
end
