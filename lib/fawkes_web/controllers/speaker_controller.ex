defmodule FawkesWeb.SpeakerController do
  use FawkesWeb, :controller

  alias Fawkes.Schedule
  alias Fawkes.Schedule.Speaker

  def index(conn, _params) do
    speakers = Schedule.list_speakers()
    render(conn, "index.html", speakers: speakers)
  end

  def new(conn, _params) do
    changeset = Schedule.change_speaker(%Speaker{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"speaker" => speaker_params}) do
    case Schedule.create_speaker(speaker_params) do
      {:ok, speaker} ->
        conn
        |> put_flash(:info, "Speaker created successfully.")
        |> redirect(to: speaker_path(conn, :show, speaker))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    speaker = Schedule.get_speaker!(id)
    render(conn, "show.html", speaker: speaker)
  end

  def edit(conn, %{"id" => id}) do
    speaker = Schedule.get_speaker!(id)
    changeset = Schedule.change_speaker(speaker)
    render(conn, "edit.html", speaker: speaker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "speaker" => speaker_params}) do
    speaker = Schedule.get_speaker!(id)

    case Schedule.update_speaker(speaker, speaker_params) do
      {:ok, speaker} ->
        conn
        |> put_flash(:info, "Speaker updated successfully.")
        |> redirect(to: speaker_path(conn, :show, speaker))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", speaker: speaker, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    speaker = Schedule.get_speaker!(id)
    {:ok, _speaker} = Schedule.delete_speaker(speaker)

    conn
    |> put_flash(:info, "Speaker deleted successfully.")
    |> redirect(to: speaker_path(conn, :index))
  end
end
