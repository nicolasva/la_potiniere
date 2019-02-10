defmodule LaPotiniere.MenusTest do
  use LaPotiniere.DataCase

  alias LaPotiniere.Menus
  alias LaPotiniere.Users
  
  describe "menus" do
    alias LaPotiniere.Menus.Menu
    alias LaPotiniere.Users.User
    @valid_attrs %{title: "Menu", picture?: 1}
    @update_attrs %{title: "menu update", picture?: 0}
    @invalid_attrs %{title: nil, picture?: 0}


  def user_fixture(attrs \\ %{}) do
    LaPotiniere.Roles.create_role(%{role_value: 0})
    username = "user#{System.unique_integer([:positive])}"
    {:ok, user} =
    attrs
    |> Enum.into(%{
      name: "Some User",
      username: username,
      email: "#{username}@example.com",
      password: nil,
      confirmation_password: "infonies"
    })
    |> Users.create_user()
    user
  end

  def menu_fixture(%Users.User{} = current_user, attrs \\ %{}) do
    attrs =
    Enum.into(attrs, %{
      title: "A Title",
      picture?: 1,
    })
    {:ok, menu} = Menus.create_menu(current_user, attrs)
    menu
  end

    test "list_menus/0 returns all menus" do
      current_user = user_fixture()
      %Menu{id: id1} = menu_fixture(current_user)
      assert [%Menu{id: ^id1}] = Menus.list_menus()
      %Menu{id: id2} = menu_fixture(current_user)
      assert [%Menu{id: ^id1}, %Menu{id: ^id2}] = Menus.list_menus()
    end
  end
end
