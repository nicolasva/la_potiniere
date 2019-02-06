defmodule LaPotiniere.RolesTest do
  use LaPotiniere.DataCase

  alias LaPotiniere.Roles

  describe "roles" do
    alias LaPotiniere.Roles.Role

    @valid_attrs %{role_value: 0}
    @update_attrs %{role_value: 1}
    @invalid_attrs %{role_value: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Roles.list_roles() == [role]
    end
  end
end
