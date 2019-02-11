defmodule LaPotiniere.EventsTest do
  use LaPotiniere.DataCase

  alias LaPotiniere.{
    Users,
    Menus,
    Events
  }

  describe "events" do
    alias LaPotiniere.Users.User
    alias LaPotiniere.Menus.Menu
    alias LaPotiniere.Events.Event

    @valid_attrs %{title: "event title", comment: "event comment"}
    @update_attrs %{title: "event update", comment: "event comment update"}
    @invalid_attrs %{title: nil, comment: nil}

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
      Enum.into(attrs, %{title: "Menu", picture?: 2})
      {:ok, menu} = Menus.create_menu(current_user, attrs)
      menu
    end

    def event_fixture(%Menus.Menu{} = menu, attrs \\ %{}) do
      attrs = 
      Enum.into(attrs, @valid_attrs)
      {:ok, event} = Events.create_event(menu, attrs)
      event
    end

    test "list_events/0 returns all events" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      %Event{id: id1} = event_fixture(menu)
      assert [%Event{id: ^id1}] = Events.list_events(menu)
    end

    test "get_event!/1 returns the events with given id" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      %Event{id: id} = event_fixture(menu)
      assert %Event{id: ^id} = Events.get_event!(id)
    end

    test "create_event/2 with valid data creates a event" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      assert {:ok, %Event{} = event} = Events.create_event(menu, @valid_attrs)
      assert event.title == "event title"
      assert event.comment == "event comment"
    end


    test "create_event/2 with invalid data returns error changeset" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      assert {:error, %Ecto.Changeset{}} = Events.create_event(menu, @invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      event = event_fixture(menu)
      assert {:ok, event} = Events.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.title == "event update"
    end

    test "update_event/2 with invalid data returns error changeset" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      %Event{id: id} = event = event_fixture(menu)
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert %Event{id: ^id} = Events.get_event!(id)
    end

    test "delete_event/1 deletes the event" do
      current_user = user_fixture()
      menu = menu_fixture(current_user)
      event = event_fixture(menu)
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert Events.list_events(menu) == []
    end
  end
end
