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

  def create_master(parent) do
    changeset = 
      parent
      |>Ecto.build_assoc(:master)
      |> Repo.insert()
  end
end
