defmodule LaPotiniere.TestHelpers do
  
  alias LaPotiniere.{
    Users,
    Menus
  }

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
end
