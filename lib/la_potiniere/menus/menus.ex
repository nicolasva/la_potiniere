defmodule LaPotiniere.Menus do
  @moduledoc """
  The Menus context.
  """

  import Ecto.Query, warn: false
  alias LaPotiniere.Repo
  alias LaPotiniere.Users.User
  alias LaPotiniere.Menus.Menu

  @doc """
  Returns the list of menus.

  ## Examples

      iex> list_menus()
      [%User{}, ...]

  """
  def list_menus do
    Repo.all(Menu) |> Repo.preload(:user)
  end

  def position(menus) do
    Enum.with_index(menus, 1)
    |> Enum.reduce(%{}, fn({id,index}, acc)-> set_position(index+1, id) end)
  end

  defp set_position(index, id) do
    from(menu in Menu, where: menu.id == ^id, update: [set: [position: ^index]])
    |> Repo.update_all([])
  end

  @doc """
  Gets a single menu.

  Raises `Ecto.NoResultsError` if the Menu does not exist.

  ## Examples

      iex> get_menu!(123)
      %Menu{}

      iex> get_menu!(456)
      ** (Ecto.NoResultsError)

  """
  def get_menu!(id), do: Repo.get!(Menu, id)

  @doc """
  Creates a menu.

  ## Examples

      iex> create_menu(%{field: value})
      {:ok, %Menu{}}

      iex> create_menu(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_menu(%User{} = current_user, attrs \\ %{}) do
    %Menu{}
    |> Menu.changeset(attrs)
    |> Ecto.Changeset.put_change(:user_id, current_user.id)
    |> Repo.insert()
  end

  @doc """
  Updates a menu.

  ## Examples

      iex> update_menu(menu, %{field: new_value})
      {:ok, %Menu{}}

      iex> update_menu(menu, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_menu(%Menu{} = menu, attrs) do
    menu
    |> Menu.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Menu.

  ## Examples

      iex> delete_menu(menu)
      {:ok, %Menu{}}

      iex> delete_menu(menu)
      {:error, %Ecto.Changeset{}}

  """
  def delete_menu(%Menu{} = menu) do
    Repo.delete(menu)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_menu(menu)
      %Ecto.Changeset{source: %Menu{}}

  """
  def change_menu(%Menu{} = menu, current_user) do
    Menu.changeset(menu, %{user_id: current_user.id})
  end
end
