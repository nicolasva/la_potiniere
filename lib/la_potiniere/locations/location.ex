defmodule LaPotiniere.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :address, :string
    field :cp_postal, :string
    field :city, :string
    belongs_to :user, LaPotiniere.Users.User
  end

  @doc false

  def changeset(location, attrs) do
    location
    |> cast(attrs, [:address, :cp_postal, :city, :user_id])
    #|> validate_required([])
  end
end
