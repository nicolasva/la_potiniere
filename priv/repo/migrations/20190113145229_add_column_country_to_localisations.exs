defmodule LaPotiniere.Repo.Migrations.AddColumnCountryToLocalisations do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      add :country, :string
    end
  end
end
