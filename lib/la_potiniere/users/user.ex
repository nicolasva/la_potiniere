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
    has_one :location, LaPotiniere.Locations.Location, on_delete: :delete_all
  end

  @doc false

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(name username email address cp_postal city country), [])
    |> validate_email_format()
    |> validate_required([:name, :username, :email])
    |> validate_length(:username, min: 1, max: 20)
  end

  def changeset_forgetting_mdp(model, params \\ :invalid) do
    model
    |> cast(params, ~w(email), [])
    |> validate_email_format()
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
        put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
