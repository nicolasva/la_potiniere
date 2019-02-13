defmodule LaPotiniere.Masters.Master do
  use Ecto.Schema
  import Ecto.Changeset

  schema "masters" do
    belongs_to :content, LaPotiniere.Contents.Content
    belongs_to :event, LaPotiniere.Events.Event
    belongs_to :photo, LaPotiniere.Photos.Photo
    timestamps()
  end
end
