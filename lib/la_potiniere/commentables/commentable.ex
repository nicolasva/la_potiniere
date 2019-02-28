defmodule LaPotiniere.Commentables.Commentable do
  use Ecto.Schema
  import Ecto.Changeset

  schema "commentables" do
    field :title, :string
    field :comment_text, :string
    field :rating_director, :integer
    field :rating_1, :integer, virtual: true
    field :rating_2, :integer, virtual: true
    field :rating_3, :integer, virtual: true
    field :rating_4, :integer, virtual: true
    field :rating_5, :integer, virtual: true
    belongs_to :event, LaPotiniere.Events.Event
    timestamps()
  end

  @doc false
  def changeset(commentable, attrs) do
    commentable
    |> cast(attrs, [:title, :comment_text, :rating_director])
    |> validate_required([:title, :comment_text, :rating_director])
  end
end
