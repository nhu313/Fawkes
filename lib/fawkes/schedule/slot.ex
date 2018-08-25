defmodule Fawkes.Schedule.Slot do
  use Ecto.Schema
  import Ecto.Changeset


  schema "schedule_slots" do
    field :end_time, Timex.Ecto.DateTime
    field :slug, :string
    field :start_time, Timex.Ecto.DateTime

    has_many :talks, Fawkes.Schedule.Talk
    has_one :event, Fawkes.Schedule.Event

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
