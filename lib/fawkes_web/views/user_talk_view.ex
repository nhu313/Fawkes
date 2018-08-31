defmodule FawkesWeb.UserTalkView do
  use FawkesWeb, :view
  alias FawkesWeb.UserTalkView

  def render("index.json", %{users_talks: users_talks}) do
    %{data: render_many(users_talks, UserTalkView, "user_talk.json")}
  end

  def render("show.json", %{user_talk: user_talk}) do
    %{data: render_one(user_talk, UserTalkView, "user_talk.json"), message: "Added successfully!"}
  end

  def render("user_talk.json", %{user_talk: user_talk}) do
    %{id: user_talk.id}
  end
end
