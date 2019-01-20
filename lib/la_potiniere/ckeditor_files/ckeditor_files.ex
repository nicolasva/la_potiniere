defmodule LaPotiniere.CkeditorFiles do
  @moduledoc """
  The CkeditorFiles context.
  """

  import Ecto.Query, warn: false
  alias LaPotiniere.Repo

  alias LaPotiniere.CkeditorFiles.CkeditorFile

  @doc """
  Returns the list of ckeditors.

  ## Examples

      iex> list_ckeditor_files()
      [%CkeditorFiles{}, ...]

  """
  def list_ckeditor_files do
    Repo.all(CkeditorFile)
  end

  @doc """
  Gets a single ckeditor_file.

  Raises `Ecto.NoResultsError` if the CkeditorFile does not exist.

  ## Examples

      iex> get_ckeditor_file!(123)
      %CkeditorFile{}

      iex> get_ckeditor_file!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ckeditor_file!(id), do: Repo.get!(CkeditorFile, id)

  @doc """
  Creates a ckeditor_file.

  ## Examples

      iex> create_ckeditor_file(%{field: value})
      {:ok, %CkeditorFile{}}

      iex> create_ckeditor_file(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ckeditor_file(attrs \\ %{}) do
    %CkeditorFile{}
    |> CkeditorFile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ckeditor_file.

  ## Examples

      iex> update_ckeditor_file(ckeditor_file, %{field: new_value})
      {:ok, %Ckeditor_file{}}

      iex> update_ckeditor_file(ckeditor_file, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ckeditor_file(%CkeditorFile{} = ckeditor_file, attrs) do
    ckeditor_file
    |> CkeditorFile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CkeditorFile.

  ## Examples

      iex> delete_ckeditor_file(ckeditor_file)
      {:ok, %CkeditorFile{}}

      iex> delete_ckeditor_file(ckeditor_file)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ckeditor_file(%CkeditorFile{} = ckeditor_file) do
    Repo.delete(ckeditor_file)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ckeditor_file changes.

  ## Examples

      iex> change_ckeditor_file(ckeditor_file)
      %Ecto.Changeset{source: %CkeditorFile{}}

  """
  def change_ckeditor_file(%CkeditorFile{} = ckeditor_file) do
    Ckeditor.changeset(ckeditor_file, %{})
  end
end
