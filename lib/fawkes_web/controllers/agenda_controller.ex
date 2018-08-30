defmodule FawkesWeb.AgendaController do
  use FawkesWeb, :controller

  alias Fawkes.Agenda

  def index(conn, _params) do
    talks = Agenda.list_talk_for_user(conn.assigns.current_user)
    render(conn, "index.html", talks: talks)
  end
end
