defmodule LaPotiniere.Repo.Migrations.CreateTableLocalisations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :address, :string
      add :cp_postal, :string
      add :city, :string
      add :user_id, references(:locations)
    end

    create unique_index(:locations, [:user_id])
  end
end
