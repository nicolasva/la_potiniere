defmodule LaPotiniere.Menus.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menus" do
    field :title, :string
    has_many :contents, LaPotiniere.Contents.Content, on_delete: :delete_all
    belongs_to :user, LaPotiniere.Users.User
    timestamps()
  end

  @doc false

  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
