defmodule LaPotiniere.Contents.Content do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contents" do
    field :reference, :string
    field :comment, :string
    belongs_to :menu, LaPotiniere.Menus.Menu
    has_many :pictures, LaPotiniere.Pictures.Picture, on_delete: :delete_all
    #has_many :masters, {"contents_masters", Master}, foreign_key: :assoc_id
    timestamps()
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:comment, :reference])
    |> validate_required([:comment, :reference])
  end
end
