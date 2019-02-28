defmodule LaPotiniere.Commentables do
  @moduledoc """
  The Commentables context.
  """

  import Ecto.Query, warn: false
  alias LaPotiniere.Repo

  alias LaPotiniere.Commentables.Commentable
  alias LaPotiniere.Events.Event

  @doc """
  Returns the list of commentables.

  ## Examples

      iex> list_commentables()
      [%Commentable{}, ...]

  """
  def list_commentables(event) do
    event_commentables = 
      event
      |> Repo.preload(:commentables)
    event_commentables.commentables
  end

  @doc """
  Gets a single Commentable.

  Raises `Ecto.NoResultsError` if the Commentable does not exist.

  ## Examples

      iex> get_commentable!(123)
      %Commentable{}

      iex> get_commentable!(456)
      ** (Ecto.NoResultsError)

  """
  def get_commentable!(id), do: Repo.get!(Commentable, id)

  @doc """
  Creates a Commentable.

  ## Examples

      iex> create_Commentable(%{field: value})
      {:ok, %commentable{}}

      iex> create_commentable(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_commentable(%Event{} = event, attrs \\ %{}) do
    %Commentable{}
    |> Commentable.changeset(attrs)
    |> Ecto.Changeset.put_change(:event_id, event.id)
    |> Repo.insert()
  end

  @doc """
  Updates a commentable.

  ## Examples

      iex> update_commentable(commentable, %{field: new_value})
      {:ok, %Commentable{}}

      iex> update_commentable(commentable, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_commentable(%Commentable{} = commentable, attrs) do
    commentable
    |> Commentable.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Commentable.

  ## Examples

      iex> delete_commentable(commentable)
      {:ok, %Commentable{}}

      iex> delete_commentable(commentable)
      {:error, %Ecto.Changeset{}}

  """
  def delete_commentable(%Commentable{} = commentable) do
    Repo.delete(commentable)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking commentable changes.

  ## Examples

      iex> change_commentable(event)
      %Ecto.Changeset{source: %Commentable{}}

  """
  def change_commentable(%Commentable{} = commentable, event_id) do
    Commentable.changeset(commentable, %{event_id: event_id})
  end
end
