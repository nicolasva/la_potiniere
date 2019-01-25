defmodule LaPotiniere.Photos.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :title, :string
    field :legend, :string
    field :photo_file, LaPotiniere.PhotoFile.Type
    belongs_to :menu, LaPotiniere.Menus.Menu
    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:title, :legend, :photo_file])
    |> cast_attachments(attrs, [:photo_file])
    |> validate_required([:photo_file])
  end
end
