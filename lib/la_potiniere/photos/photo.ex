defmodule LaPotiniere.Photos.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :title, :string
    field :legend, :string
    belongs_to :menu, LaPotiniere.Menus.Menu
    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:comment, :reference])
    |> validate_required([:comment, :reference])
  end
end
