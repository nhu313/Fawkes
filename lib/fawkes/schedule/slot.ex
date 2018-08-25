defmodule Fawkes.Schedule.Slot do
  use Ecto.Schema
  import Ecto.Changeset


  schema "schedule_slots" do
    field :end_time, :utc_datetime
    field :slug, :string
    field :start_time, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, [:slug, :start_time, :end_time])
    |> validate_required([:slug, :start_time, :end_time])
    |> unique_constraint(:slug)
  end
end
