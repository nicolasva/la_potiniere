defmodule LaPotiniere.Contents do
  @moduledoc """
  The Contents context.
  """

  import Ecto.Query, warn: false
  alias LaPotiniere.Repo
  alias LaPotiniere.Menus.Menu
  alias LaPotiniere.Contents.Content

  @doc """
  Returns the list of contents.

  ## Examples

      iex> list_contents()
      [%Content{}, ...]

  """
  def list_contents(%Menu{} = menu) do
    menu_contents = 
      menu
      |> Repo.preload(:contents)
    menu_contents.contents
  end

  @doc """
  Gets a single Content.

  Raises `Ecto.NoResultsError` if the Content does not exist.

  ## Examples

      iex> get_content!(123)
      %User{}

      iex> get_content!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content!(id), do: Repo.get!(Content, id)

  @doc """
  Creates a Content.

  ## Examples

      iex> create_content(%{field: value})
      {:ok, %content{}}

      iex> create_content(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content(%Menu{} = menu, attrs \\ %{}) do
    %Content{}
    |> Content.changeset(attrs)
    |> Ecto.Changeset.put_change(:menu_id, menu.id)
    |> Repo.insert()
  end

  @doc """
  Updates a content.

  ## Examples

      iex> update_content(content, %{field: new_value})
      {:ok, %Content{}}

      iex> update_content(content, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content(%Content{} = content, attrs) do
    content
    |> Content.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Content.

  ## Examples

      iex> delete_content(content)
      {:ok, %Content{}}

      iex> delete_content(content)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content(%Content{} = content) do
    Repo.delete(content)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_content(content)
      %Ecto.Changeset{source: %Content{}}

  """
  def change_content(%Content{} = content, menu_id) do
    Content.changeset(content, %{menu_id: menu_id})
  end
end
