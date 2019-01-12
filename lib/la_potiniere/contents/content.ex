defmodule LaPotiniere.Contents.Content do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contents" do
    field :contents, :string
    belongs_to :menu, LaPotiniere.Menus.Menu
    has_many :pictures, LaPotiniere.Pictures.Picture, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:contents])
    |> validate_required([:contents, :menu_id])
  end
end
