defmodule SystemicSocket.DrawTest do
  use SystemicSocket.DataCase

  alias SystemicSocket.Draw

  describe "points" do
    alias SystemicSocket.Draw.Point

    @valid_attrs %{c: "some c", isDummy: true, r: 42, x: 42, y: 42}
    @update_attrs %{c: "some updated c", isDummy: false, r: 43, x: 43, y: 43}
    @invalid_attrs %{c: nil, isDummy: nil, r: nil, x: nil, y: nil}

    def point_fixture(attrs \\ %{}) do
      {:ok, point} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Draw.create_point()

      point
    end

    test "list_points/0 returns all points" do
      point = point_fixture()
      assert Draw.list_points() == [point]
    end

    test "get_point!/1 returns the point with given id" do
      point = point_fixture()
      assert Draw.get_point!(point.id) == point
    end

    test "create_point/1 with valid data creates a point" do
      assert {:ok, %Point{} = point} = Draw.create_point(@valid_attrs)
      assert point.c == "some c"
      assert point.isDummy == true
      assert point.r == 42
      assert point.x == 42
      assert point.y == 42
    end

    test "create_point/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Draw.create_point(@invalid_attrs)
    end

    test "update_point/2 with valid data updates the point" do
      point = point_fixture()
      assert {:ok, %Point{} = point} = Draw.update_point(point, @update_attrs)
      assert point.c == "some updated c"
      assert point.isDummy == false
      assert point.r == 43
      assert point.x == 43
      assert point.y == 43
    end

    test "update_point/2 with invalid data returns error changeset" do
      point = point_fixture()
      assert {:error, %Ecto.Changeset{}} = Draw.update_point(point, @invalid_attrs)
      assert point == Draw.get_point!(point.id)
    end

    test "delete_point/1 deletes the point" do
      point = point_fixture()
      assert {:ok, %Point{}} = Draw.delete_point(point)
      assert_raise Ecto.NoResultsError, fn -> Draw.get_point!(point.id) end
    end

    test "change_point/1 returns a point changeset" do
      point = point_fixture()
      assert %Ecto.Changeset{} = Draw.change_point(point)
    end
  end
end
