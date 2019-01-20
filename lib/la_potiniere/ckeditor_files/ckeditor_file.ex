defmodule LaPotiniere.CkeditorFiles.CkeditorFile do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  schema "ckeditor_files" do
    field :file, LaPotiniere.CkeditorFile.Type
    timestamps()
  end

  @doc false

  def changeset(ckeditor, attrs) do
    ckeditor
    |> cast(attrs, [:file])
    |> cast_attachments(attrs, [:file])
    |> validate_required([:file])
  end
end
