defmodule LaPotiniere.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias LaPotiniere.Repo
  alias LaPotiniere.Menus.Menu
  alias LaPotiniere.Events.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events(%Menu{} = menu) do
    from(event in Event, where: event.menu_id == ^menu.id, order_by: event.position) |> Repo.all
  end

  def position(events) do
    Enum.with_index(events, 1)
    |> Enum.reduce(%{}, fn({id,index}, acc)-> set_position(index+1, id) end)
  end

  defp set_position(index, id) do
    from(event in Event, where: event.id == ^id, update: [set: [position: ^index]])
    |> Repo.update_all([])
  end

  @doc """
  Gets a single Event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a Event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(%Menu{} = menu, attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Ecto.Changeset.put_change(:menu_id, menu.id)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{source: %Event{}}

  """
  def change_event(%Event{} = event, menu_id) do
    Event.changeset(event, %{menu_id: menu_id})
  end
end
