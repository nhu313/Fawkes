defmodule FawkesWeb.SpeakerControllerTest do
  use FawkesWeb.ConnCase

  alias Fawkes.Schedule

  @create_attrs %{company: "some company", description: "some description", first: "some first", github: "some github", image_url: "some image_url", last: "some last", slug: "some slug", twitter: "some twitter"}
  @update_attrs %{company: "some updated company", description: "some updated description", first: "some updated first", github: "some updated github", image_url: "some updated image_url", last: "some updated last", slug: "some updated slug", twitter: "some updated twitter"}
  @invalid_attrs %{company: nil, description: nil, first: nil, github: nil, image_url: nil, last: nil, slug: nil, twitter: nil}

  def fixture(:speaker) do
    {:ok, speaker} = Schedule.create_speaker(@create_attrs)
    speaker
  end

  describe "index" do
    test "lists all speakers", %{conn: conn} do
      conn = get conn, speaker_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Speakers"
    end
  end

  describe "new speaker" do
    test "renders form", %{conn: conn} do
      conn = get conn, speaker_path(conn, :new)
      assert html_response(conn, 200) =~ "New Speaker"
    end
  end

  describe "create speaker" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, speaker_path(conn, :create), speaker: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == speaker_path(conn, :show, id)

      conn = get conn, speaker_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Speaker"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, speaker_path(conn, :create), speaker: @invalid_attrs
      assert html_response(conn, 200) =~ "New Speaker"
    end
  end

  describe "edit speaker" do
    setup [:create_speaker]

    test "renders form for editing chosen speaker", %{conn: conn, speaker: speaker} do
      conn = get conn, speaker_path(conn, :edit, speaker)
      assert html_response(conn, 200) =~ "Edit Speaker"
    end
  end

  describe "update speaker" do
    setup [:create_speaker]

    test "redirects when data is valid", %{conn: conn, speaker: speaker} do
      conn = put conn, speaker_path(conn, :update, speaker), speaker: @update_attrs
      assert redirected_to(conn) == speaker_path(conn, :show, speaker)

      conn = get conn, speaker_path(conn, :show, speaker)
      assert html_response(conn, 200) =~ "some updated company"
    end

    test "renders errors when data is invalid", %{conn: conn, speaker: speaker} do
      conn = put conn, speaker_path(conn, :update, speaker), speaker: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Speaker"
    end
  end

  describe "delete speaker" do
    setup [:create_speaker]

    test "deletes chosen speaker", %{conn: conn, speaker: speaker} do
      conn = delete conn, speaker_path(conn, :delete, speaker)
      assert redirected_to(conn) == speaker_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, speaker_path(conn, :show, speaker)
      end
    end
  end

  defp create_speaker(_) do
    speaker = fixture(:speaker)
    {:ok, speaker: speaker}
  end
end
