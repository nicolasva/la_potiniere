defmodule LaPotiniere.Masters.Master do
  use Ecto.Schema
  import Ecto.Changeset

  schema "abstract table: masters" do
    field :master_checked?, :boolean
    field :assoc_id, :integer
    timestamps()
  end

  #@doc false
  #def changeset(content, attrs) do
    #  content
    #  |> cast(attrs, [:comment, :reference])
    #|> validate_required([:comment, :reference])
    #end
end
