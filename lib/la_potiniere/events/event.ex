defmodule LaPotiniere.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :comment, :string
    belongs_to :menu, LaPotiniere.Menus.Menu
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :comment])
    |> validate_required([:title, :comment])
  end
end
