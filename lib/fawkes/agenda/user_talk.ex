defmodule Fawkes.Agenda.UserTalk do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users_talks" do
    field :user_id, :id
    field :talk_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_talk, attrs) do
    user_talk
    |> cast(attrs, [:user_id, :talk_id])
    |> validate_required([])
  end
end
