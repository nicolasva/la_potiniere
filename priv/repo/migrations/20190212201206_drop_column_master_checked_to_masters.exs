defmodule LaPotiniere.Repo.Migrations.DropColumnMasterCheckedToMasters do
  use Ecto.Migration

  def change do
    alter table(:masters) do
      remove :master_checked?
    end
  end
end
