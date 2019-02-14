defmodule LaPotiniere.Masters do
  @moduledoc """
  The masters context
  """

  import Ecto.Query, warn: false
  alias LaPotiniere.Repo
  alias LaPotiniere.Masters.Master
  alias LaPotiniere.Events.Event
  alias LaPotiniere.Pictures.Picture
  alias LaPotiniere.Contents.Content

  @doc """
  returns the list of masters.
  """

  def list_masters do
    Repo.all(Master) |> Repo.preload(:events) |> Repo.preload(:pictures) |> Repo.preload(:contents)
  end

  def get_master!(id), do: Repo.get!(Master, id)

  def create_master(parent) do
    delete_all()
    changeset = 
      parent
      |>Ecto.build_assoc(:master)
      |> Repo.insert()
  end

  def menu_master! do
    master = get_master!(7) |> Repo.preload([[content: :menu], [photo: :menu], [event: :menu]])
    if master.content, do: master.content.menu
    if master.event, do: master.event.menu
    if master.photo, do: master.photo.menu
  end

  defp delete_all do
    LaPotiniere.Masters.Master |> LaPotiniere.Repo.delete_all()
  end
end
