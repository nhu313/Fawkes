defmodule FawkesWeb.ProfileController do
  use FawkesWeb, :controller

  alias Fawkes.Membership

  def edit(conn, _params) do
    render(conn, "edit.html", changeset: Membership.profile_changeset(conn.assigns.current_user))
  end

  def update(conn, %{"info" => params}) do
    case Membership.update_profile(conn.assigns.current_user, params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: slot_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def index(conn, _) do
    render(conn, "index.html", profiles: Membership.fetch_user_profiles())
  end

  def show(conn, %{"id" => slug}) do
    render(conn, "show.html", user: Membership.fetch_user_profile(slug))
  end
end
