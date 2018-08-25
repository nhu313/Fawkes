defmodule FawkesWeb.TalkController do
  use FawkesWeb, :controller

  alias Fawkes.Schedule
  alias Fawkes.Schedule.Talk

  def show(conn, %{"id" => id}) do
    talk = Schedule.get_talk!(id)
    render(conn, "show.html", talk: talk)
  end
end
