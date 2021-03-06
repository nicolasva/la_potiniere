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
    Repo.all(Master) |> Repo.preload(:event) |> Repo.preload(:picture) |> Repo.preload(:content)
  end

  def get_master!, do: Repo.one(Master)

  def create_master(parent) do
    delete_all()
    #changeset = 
    parent
    |>Ecto.build_assoc(:master)
    |> Repo.insert()
  end

  def content_master do
    master = get_master! |> Repo.preload([:content, :photo, :event])
    master.content
  end

  def event_master do
    master = get_master! |> Repo.preload([:content, :photo, :event])
    master.event
  end

  def photo_master do
    master = get_master! |> Repo.preload([:content, :photo, :event])
    master.photo
  end

  def menu_master do
    master = get_master! |> Repo.preload([[content: :menu], [photo: :menu], [event: :menu]])
    cond do
      master.event ->
        master.event.menu
      master.content ->
        master.content.menu
      master.photo ->
        master.photo.menu
    end
  end

  def get_menu do
    menu_master |> LaPotiniere.Repo.preload([:contents, :photos, :events])
  end

  defp delete_all do
    LaPotiniere.Masters.Master |> LaPotiniere.Repo.delete_all()
  end
end
