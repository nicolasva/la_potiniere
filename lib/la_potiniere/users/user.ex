defmodule LaPotiniere.Users.User do
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
    many_to_many :roles, LaPotiniere.Roles.Role, join_through: "roles_users", on_replace: :delete
    #has_many :menus, LaPotiniere.Menus.Menu, on_delete: :nothing
    has_one :location, LaPotiniere.Locations.Location, on_delete: :delete_all
    timestamps()
  end

  @doc false

  def changeset(user, attrs) do
    user
    |> cast(attrs, ~w(name username email))
    |> validate_email_format()
    |> validate_required([:name, :username, :email])
    |> validate_length(:username, min: 1, max: 20)
  end

  def changeset_password(user, attrs) do
    user
    |> cast(attrs, ~w(password))
    |> validate_length(:password, min: 6, max: 100)
    |> put_encrypted_password()
    |> user_to_role()
  end

  def changeset_forgetting_mdp(model, params) do
    model
    |> cast(params, ~w(email), [])
    |> validate_email_format()
    |> put_encrypted_password()
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> password_validate()
    |> put_encrypted_password()
  end

  defp password_validate(model) do
    model
    |> validate_length(:password, min: 6, max: 100)
  end

  defp validate_email_format(model) do
    model
    |> validate_required(:email)
    |> validate_format(:email, ~r/@/)
  end

  defp put_encrypted_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        IO.inspect "#{Comeonin.Bcrypt.hashpwsalt(password)}"
        put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end

  #defp assoc_roles_users(conn, role, user_id) do
    #  IO.inspect "user_id -=-=-=-=-=-=-=-=-=--#{user_id}"
    #roles = Enum.at(role, 0)
    #user = IpapyWeb.Repo.get!(IpapyWeb.User, user_id)
    #user = IpapyWeb.Repo.preload(user, :roles)
    #roles = :maps.filter fn _, v -> v != "false" end, roles["roles"]
    #roles = Map.keys(roles)
    #array_roles = Enum.map(roles, fn(x) -> IpapyWeb.Repo.preload(IpapyWeb.Repo.get(IpapyWeb.Role, x), :users) end)
    #changeset = Ecto.Changeset.change(user) |> Ecto.Changeset.put_assoc(:roles, array_roles)
    #if IpapyWeb.Repo.update!(changeset) do
      #  {:ok, conn}
      #else
        #  {:error, :error_roles_users, conn}
        #end
        #end
  defp user_to_role(user) do
    user
    |> Ecto.Changeset.change() 
    |> Ecto.Changeset.put_assoc(:roles, [LaPotiniere.Repo.get_by(LaPotiniere.Roles.Role, role_value: 0)])
  end

end
