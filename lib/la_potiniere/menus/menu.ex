defmodule LaPotiniere.Menus.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  import EnumsHelper

   enum "array_picture?" do
     %{ content: 0, picture: 1, event: 2 }
   end

  schema "menus" do
    field :title, :string
    field :picture?, :integer
    has_many :contents, LaPotiniere.Contents.Content, on_delete: :delete_all
    has_many :photos, LaPotiniere.Photos.Photo, on_delete: :delete_all
    has_many :events, LaPotiniere.Events.Event, on_delete: :delete_all
    belongs_to :user, LaPotiniere.Users.User
    timestamps()
  end

  @doc false

  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:title, :user_id, :picture?])
    |> validate_required([:title])
  end
end
