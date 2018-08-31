defmodule Fawkes.AgendaTest do
  use Fawkes.DataCase

  alias Fawkes.Agenda

  describe "users_talks" do
    alias Fawkes.Agenda.UserTalk

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_talk_fixture(attrs \\ %{}) do
      {:ok, user_talk} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Agenda.create_user_talk()

      user_talk
    end

    test "list_users_talks/0 returns all users_talks" do
      user_talk = user_talk_fixture()
      assert Agenda.list_users_talks() == [user_talk]
    end

    test "get_user_talk!/1 returns the user_talk with given id" do
      user_talk = user_talk_fixture()
      assert Agenda.get_user_talk!(user_talk.id) == user_talk
    end

    test "create_user_talk/1 with valid data creates a user_talk" do
      assert {:ok, %UserTalk{} = user_talk} = Agenda.create_user_talk(@valid_attrs)
    end

    test "create_user_talk/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Agenda.create_user_talk(@invalid_attrs)
    end

    test "update_user_talk/2 with valid data updates the user_talk" do
      user_talk = user_talk_fixture()
      assert {:ok, user_talk} = Agenda.update_user_talk(user_talk, @update_attrs)
      assert %UserTalk{} = user_talk
    end

    test "update_user_talk/2 with invalid data returns error changeset" do
      user_talk = user_talk_fixture()
      assert {:error, %Ecto.Changeset{}} = Agenda.update_user_talk(user_talk, @invalid_attrs)
      assert user_talk == Agenda.get_user_talk!(user_talk.id)
    end

    test "delete_user_talk/1 deletes the user_talk" do
      user_talk = user_talk_fixture()
      assert {:ok, %UserTalk{}} = Agenda.delete_user_talk(user_talk)
      assert_raise Ecto.NoResultsError, fn -> Agenda.get_user_talk!(user_talk.id) end
    end

    test "change_user_talk/1 returns a user_talk changeset" do
      user_talk = user_talk_fixture()
      assert %Ecto.Changeset{} = Agenda.change_user_talk(user_talk)
    end
  end
end
