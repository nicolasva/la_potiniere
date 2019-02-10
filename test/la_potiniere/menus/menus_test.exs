defmodule LaPotiniere.MenusTest do
  use LaPotiniere.DataCase

  alias LaPotiniere.Menus

  describe "menus" do
    alias LaPotiniere.Menus.Menu

    @valid_attrs %{title: "Menu", picture?: 1}
    @update_attrs %{title: "menu update", picture?: 0}
    @invalid_attrs %{title: nil, picture?: 0}

    def menu_fixture(attrs \\ %{}) do
      LaPotiniere.Roles.create_role(%{role_value: 0})
      user = LaPotiniere.Users.create_user(%{name: "VANDENBOGAERDE", username: "nicolasva", password: nil, email: "nicolas.vandenbogaerde@gmail.com"})
      Map.put(@valid_attrs, :user, user)
      {:ok, menu} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menus.create_menu()
      menu
    end

    test "list_menus/0 returns all menus" do
      menu = menu_fixture()
      IO.puts "menu -=-=-=-=-=-==-=-=-{menu}"
      assert Menus.list_menus() == [menu]
    end
  end
end
