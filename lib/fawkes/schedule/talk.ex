defmodule Fawkes.Schedule.Talk do
  use Ecto.Schema
  import Ecto.Changeset


  schema "talks" do
    field :description, :string
    field :slug, :string
    field :title, :string
    field :slot_id, :id
    field :audience_id, :id
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(talk, attrs) do
    talk
    |> cast(attrs, [:slug, :title, :description])
    |> validate_required([:slug, :title, :description])
    |> unique_constraint(:slug)
  end
end
