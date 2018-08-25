defmodule Fawkes.ScheduleTest do
  use Fawkes.DataCase

  alias Fawkes.Schedule

  describe "audiences" do
    alias Fawkes.Schedule.Audience

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def audience_fixture(attrs \\ %{}) do
      {:ok, audience} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_audience()

      audience
    end

    test "list_audiences/0 returns all audiences" do
      audience = audience_fixture()
      assert Schedule.list_audiences() == [audience]
    end

    test "get_audience!/1 returns the audience with given id" do
      audience = audience_fixture()
      assert Schedule.get_audience!(audience.id) == audience
    end

    test "create_audience/1 with valid data creates a audience" do
      assert {:ok, %Audience{} = audience} = Schedule.create_audience(@valid_attrs)
      assert audience.name == "some name"
      assert audience.slug == "some slug"
    end

    test "create_audience/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_audience(@invalid_attrs)
    end

    test "update_audience/2 with valid data updates the audience" do
      audience = audience_fixture()
      assert {:ok, audience} = Schedule.update_audience(audience, @update_attrs)
      assert %Audience{} = audience
      assert audience.name == "some updated name"
      assert audience.slug == "some updated slug"
    end

    test "update_audience/2 with invalid data returns error changeset" do
      audience = audience_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_audience(audience, @invalid_attrs)
      assert audience == Schedule.get_audience!(audience.id)
    end

    test "delete_audience/1 deletes the audience" do
      audience = audience_fixture()
      assert {:ok, %Audience{}} = Schedule.delete_audience(audience)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_audience!(audience.id) end
    end

    test "change_audience/1 returns a audience changeset" do
      audience = audience_fixture()
      assert %Ecto.Changeset{} = Schedule.change_audience(audience)
    end
  end
end
