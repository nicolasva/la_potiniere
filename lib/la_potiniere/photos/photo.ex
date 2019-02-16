defmodule LaPotiniere.Photos.Photo do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :title, :string
    field :legend, :string
    field :position, :integer
    field :photo_file, LaPotiniere.PhotoFile.Type
    belongs_to :menu, LaPotiniere.Menus.Menu
    has_one :master, LaPotiniere.Masters.Master, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:title, :legend, :photo_file, :menu_id])
    |> cast_attachments(attrs, [:photo_file])
    |> validate_required([:photo_file])
  end
end
