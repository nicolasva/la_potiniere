defmodule LaPotiniere.Roles.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :role_value, :integer
    many_to_many :users, LaPotiniere.Users.User, join_through: "roles_users", on_replace: :delete
    timestamps()
  end

  @doc false

  def changeset(role, attrs) do
    role
    |> cast(attrs, [:role_value])
    |> validate_required([:role_value])
  end
end
