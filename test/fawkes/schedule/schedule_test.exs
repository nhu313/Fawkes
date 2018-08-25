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

  describe "schedule_slots" do
    alias Fawkes.Schedule.Slot

    @valid_attrs %{end_time: "2010-04-17 14:00:00.000000Z", slug: "some slug", start_time: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{end_time: "2011-05-18 15:01:01.000000Z", slug: "some updated slug", start_time: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{end_time: nil, slug: nil, start_time: nil}

    def slot_fixture(attrs \\ %{}) do
      {:ok, slot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_slot()

      slot
    end

    test "list_schedule_slots/0 returns all schedule_slots" do
      slot = slot_fixture()
      assert Schedule.list_schedule_slots() == [slot]
    end

    test "get_slot!/1 returns the slot with given id" do
      slot = slot_fixture()
      assert Schedule.get_slot!(slot.id) == slot
    end

    test "create_slot/1 with valid data creates a slot" do
      assert {:ok, %Slot{} = slot} = Schedule.create_slot(@valid_attrs)
      assert slot.end_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert slot.slug == "some slug"
      assert slot.start_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_slot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_slot(@invalid_attrs)
    end

    test "update_slot/2 with valid data updates the slot" do
      slot = slot_fixture()
      assert {:ok, slot} = Schedule.update_slot(slot, @update_attrs)
      assert %Slot{} = slot
      assert slot.end_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert slot.slug == "some updated slug"
      assert slot.start_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_slot/2 with invalid data returns error changeset" do
      slot = slot_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_slot(slot, @invalid_attrs)
      assert slot == Schedule.get_slot!(slot.id)
    end

    test "delete_slot/1 deletes the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{}} = Schedule.delete_slot(slot)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_slot!(slot.id) end
    end

    test "change_slot/1 returns a slot changeset" do
      slot = slot_fixture()
      assert %Ecto.Changeset{} = Schedule.change_slot(slot)
    end
  end

  describe "speakers" do
    alias Fawkes.Schedule.Speaker

    @valid_attrs %{company: "some company", description: "some description", first: "some first", github: "some github", image_url: "some image_url", last: "some last", slug: "some slug", twitter: "some twitter"}
    @update_attrs %{company: "some updated company", description: "some updated description", first: "some updated first", github: "some updated github", image_url: "some updated image_url", last: "some updated last", slug: "some updated slug", twitter: "some updated twitter"}
    @invalid_attrs %{company: nil, description: nil, first: nil, github: nil, image_url: nil, last: nil, slug: nil, twitter: nil}

    def speaker_fixture(attrs \\ %{}) do
      {:ok, speaker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_speaker()

      speaker
    end

    test "list_speakers/0 returns all speakers" do
      speaker = speaker_fixture()
      assert Schedule.list_speakers() == [speaker]
    end

    test "get_speaker!/1 returns the speaker with given id" do
      speaker = speaker_fixture()
      assert Schedule.get_speaker!(speaker.id) == speaker
    end

    test "create_speaker/1 with valid data creates a speaker" do
      assert {:ok, %Speaker{} = speaker} = Schedule.create_speaker(@valid_attrs)
      assert speaker.company == "some company"
      assert speaker.description == "some description"
      assert speaker.first == "some first"
      assert speaker.github == "some github"
      assert speaker.image_url == "some image_url"
      assert speaker.last == "some last"
      assert speaker.slug == "some slug"
      assert speaker.twitter == "some twitter"
    end

    test "create_speaker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_speaker(@invalid_attrs)
    end

    test "update_speaker/2 with valid data updates the speaker" do
      speaker = speaker_fixture()
      assert {:ok, speaker} = Schedule.update_speaker(speaker, @update_attrs)
      assert %Speaker{} = speaker
      assert speaker.company == "some updated company"
      assert speaker.description == "some updated description"
      assert speaker.first == "some updated first"
      assert speaker.github == "some updated github"
      assert speaker.image_url == "some updated image_url"
      assert speaker.last == "some updated last"
      assert speaker.slug == "some updated slug"
      assert speaker.twitter == "some updated twitter"
    end

    test "update_speaker/2 with invalid data returns error changeset" do
      speaker = speaker_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_speaker(speaker, @invalid_attrs)
      assert speaker == Schedule.get_speaker!(speaker.id)
    end

    test "delete_speaker/1 deletes the speaker" do
      speaker = speaker_fixture()
      assert {:ok, %Speaker{}} = Schedule.delete_speaker(speaker)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_speaker!(speaker.id) end
    end

    test "change_speaker/1 returns a speaker changeset" do
      speaker = speaker_fixture()
      assert %Ecto.Changeset{} = Schedule.change_speaker(speaker)
    end
  end
end
