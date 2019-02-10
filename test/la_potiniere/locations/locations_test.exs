defmodule LaPotiniere.LocationsTest do
  use LaPotiniere.DataCase

  alias LaPotiniere.Locations

  describe "locations" do
    alias LaPotiniere.Locations.Location


    @valid_attrs %{address: "30 Rue François Arago", cp_postal: "93500", city: "PANTIN"}
  

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        Locations.create_location(attrs, user)

      location
    end

    test "list_locations/0 returns all locations" do
      LaPotiniere.Roles.create_role(%{role_value: 0})
      user = LaPotiniere.Users.create_user(%{name: "VANDENBOGAERDE", username: "nicolasva", password: nil, email: "nicolas.vandenbogaerde@gmail.com"})
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end
  end
end
