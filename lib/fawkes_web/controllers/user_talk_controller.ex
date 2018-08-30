defmodule FawkesWeb.UserTalkController do
  use FawkesWeb, :controller

  alias Fawkes.Agenda
  alias Fawkes.Agenda.UserTalk

  action_fallback FawkesWeb.FallbackController

  def index(conn, _params) do
    users_talks = Agenda.list_users_talks()
    render(conn, "index.json", users_talks: users_talks)
  end

  def create(conn, user_talk_params) do
    with {:ok, %UserTalk{} = user_talk} <- Agenda.create_user_talk(user_talk_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_talk_path(conn, :show, user_talk))
      |> render("show.json", user_talk: user_talk)
    end
  end

  def show(conn, %{"id" => id}) do
    user_talk = Agenda.get_user_talk!(id)
    render(conn, "show.json", user_talk: user_talk)
  end

  def update(conn, %{"id" => id, "user_talk" => user_talk_params}) do
    user_talk = Agenda.get_user_talk!(id)

    with {:ok, %UserTalk{} = user_talk} <- Agenda.update_user_talk(user_talk, user_talk_params) do
      render(conn, "show.json", user_talk: user_talk)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_talk = Agenda.get_user_talk!(id)
    with {:ok, %UserTalk{}} <- Agenda.delete_user_talk(user_talk) do
      send_resp(conn, :no_content, "")
    end
  end
end
