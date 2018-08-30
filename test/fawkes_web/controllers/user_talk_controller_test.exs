defmodule FawkesWeb.UserTalkControllerTest do
  use FawkesWeb.ConnCase

  alias Fawkes.Agenda
  alias Fawkes.Agenda.UserTalk

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:user_talk) do
    {:ok, user_talk} = Agenda.create_user_talk(@create_attrs)
    user_talk
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users_talks", %{conn: conn} do
      conn = get conn, user_talk_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_talk" do
    test "renders user_talk when data is valid", %{conn: conn} do
      conn = post conn, user_talk_path(conn, :create), user_talk: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, user_talk_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_talk_path(conn, :create), user_talk: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_talk" do
    setup [:create_user_talk]

    test "renders user_talk when data is valid", %{conn: conn, user_talk: %UserTalk{id: id} = user_talk} do
      conn = put conn, user_talk_path(conn, :update, user_talk), user_talk: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, user_talk_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, user_talk: user_talk} do
      conn = put conn, user_talk_path(conn, :update, user_talk), user_talk: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_talk" do
    setup [:create_user_talk]

    test "deletes chosen user_talk", %{conn: conn, user_talk: user_talk} do
      conn = delete conn, user_talk_path(conn, :delete, user_talk)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, user_talk_path(conn, :show, user_talk)
      end
    end
  end

  defp create_user_talk(_) do
    user_talk = fixture(:user_talk)
    {:ok, user_talk: user_talk}
  end
end
