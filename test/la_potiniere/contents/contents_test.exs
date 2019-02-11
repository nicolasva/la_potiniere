defmodule LaPotiniere.ContentsTest do
  use LaPotiniere.DataCase

  alias LaPotiniere.{
    Users,
    Menus,
    Contents
  }

  describe "contents" do
    alias LaPotiniere.Users.User
    alias LaPotiniere.Menus.Menu
    alias LaPotiniere.Contents.Content
    
    @valid_attrs %{reference: "test", comment: "test comment"}
    @update_attrs %{reference: "test update", comment: "test comment update"}
    @invalid_attrs %{reference: nil, comment: nil}
    
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
      Enum.into(attrs, %{title: "Menu", picture?: 1})
      {:ok, menu} = Menus.create_menu(current_user, attrs)
      menu
    end

    def content_fixture(%Menus.Menu{} = menu, attrs \\ %{}) do
      attrs = 
      Enum.into(attrs, @valid_attrs)
      {:ok, content} = Contents.create_content(menu, attrs)
      content
    end

    test "list_contents/0 returns all contents" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      %Content{id: id1} = content_fixture(menu)
      assert [%Content{id: ^id1}] = Contents.list_contents(menu)
      %Content{id: id2} = content_fixture(menu)
      assert [%Content{id: ^id2}, %Content{id: ^id1}] = Contents.list_contents(menu)
    end

    test "get_content!/1 returns the contents with given id" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      %Content{id: id} = content_fixture(menu)
      assert %Content{id: ^id} = Contents.get_content!(id)
    end

    test "create_content/2 with valid data creates a content" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      assert {:ok, %Content{} = content} = Contents.create_content(menu, @valid_attrs)
      assert content.reference == "test"
      assert content.comment == "test comment"
    end

    test "create_content/2 with invalid data returns error changeset" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      assert {:error, %Ecto.Changeset{}} = Contents.create_content(menu, @invalid_attrs)
    end

    test "update_content/2 with valid data updates the content" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      content = content_fixture(menu)
      assert {:ok, content} = Contents.update_content(content, @update_attrs)
      assert %Content{} = content
      assert content.reference == "test update"
    end

    test "update_content/2 with invalid data returns error changeset" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      %Content{id: id} = content = content_fixture(menu)
      assert {:error, %Ecto.Changeset{}} = Contents.update_content(content, @invalid_attrs)
      assert %Content{id: ^id} = Contents.get_content!(id)
    end

    test "delete_content/1 deletes the content" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      content = content_fixture(menu)
      assert {:ok, %Content{}} = Contents.delete_content(content)
      assert Contents.list_contents(menu) == []
    end
  end
end
