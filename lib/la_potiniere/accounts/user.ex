defmodule LaPotiniere.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    field :username, :string
    field :current_password, :string, virtual: true
    field :password, :string, virtual: true
    field :confirmation_password, :string, virtual: true
    field :encrypted_password, :string
    field :email, :string
    has_many :menus, LaPotiniere.Menus.Menu
    has_one :location, LaPotiniere.Locations.Location, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email])
    |> validate_required([:name, :username, :email])
  end
end
