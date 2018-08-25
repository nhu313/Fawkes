defmodule FawkesWeb.SlotController do
  use FawkesWeb, :controller

  alias Fawkes.Schedule
  alias Fawkes.Schedule.Slot

  def index(conn, _params) do
    schedule_slots = Schedule.list_schedule_slots()
    render(conn, "index.html", schedule_slots: schedule_slots)
  end

  def new(conn, _params) do
    changeset = Schedule.change_slot(%Slot{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"slot" => slot_params}) do
    case Schedule.create_slot(slot_params) do
      {:ok, slot} ->
        conn
        |> put_flash(:info, "Slot created successfully.")
        |> redirect(to: slot_path(conn, :show, slot))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    slot = Schedule.get_slot!(id)
    render(conn, "show.html", slot: slot)
  end

  def edit(conn, %{"id" => id}) do
    slot = Schedule.get_slot!(id)
    changeset = Schedule.change_slot(slot)
    render(conn, "edit.html", slot: slot, changeset: changeset)
  end

  def update(conn, %{"id" => id, "slot" => slot_params}) do
    slot = Schedule.get_slot!(id)

    case Schedule.update_slot(slot, slot_params) do
      {:ok, slot} ->
        conn
        |> put_flash(:info, "Slot updated successfully.")
        |> redirect(to: slot_path(conn, :show, slot))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", slot: slot, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    slot = Schedule.get_slot!(id)
    {:ok, _slot} = Schedule.delete_slot(slot)

    conn
    |> put_flash(:info, "Slot deleted successfully.")
    |> redirect(to: slot_path(conn, :index))
  end
end
