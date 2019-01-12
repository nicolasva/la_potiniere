defmodule LaPotiniere.Menus.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menus" do
    field :title, :string
    timestamps()
  end

  @doc false

  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
