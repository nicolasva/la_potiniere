defmodule LaPotiniere.Comments.Commentt do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :title, :string
    field :comment_text, :string
    field :rating_director, :integer
    field :rating_1, :integer, virtual: true
    field :rating_2, :integer, virtual: true
    field :rating_3, :integer, virtual: true
    field :rating_4, :integer, virtual: true
    field :rating_5, :integer, virtual: true
    belongs_to :event, LaPotiniere.Events.Event
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:title, :comment_text, :rating_director])
    |> validate_required([:title, :comment, :rating_director])
  end
end
