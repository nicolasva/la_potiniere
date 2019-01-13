defmodule LaPotiniere.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :current_password, :string, virtual: true
    field :password, :string, virtual: true
    field :confirmation_password, :string, virtual: true
    field :encrypted_password, :string, virtual: true
    field :email, :string
    has_many :menus, LaPotiniere.Menus.Menu
    has_one :location, LaPotiniere.Locations.Location
  end

  @doc false

  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
