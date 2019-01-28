defmodule LaPotiniere.Pictures.Picture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pictures" do
    field :title
    belongs_to :content, LaPotiniere.Contents.Content
    has_many :masters, {"contents_pictures", Master}, foreign_key: :assoc_id
    timestamps()
  end

  @doc false

  def changeset(picture, attrs) do
    picture
    |> cast(attrs, [:title])
    |> validate_required([:title, :content_id])
  end
end
