defmodule Fawkes.Schedule.Category do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories" do
    field :icon_url, :string
    field :name, :string
    field :slug, :string

    many_to_many :talks, Fawkes.Schedule.Talk, join_through: "talks_categories"

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:slug, :name, :icon_url])
    |> validate_required([:slug, :name])
    |> unique_constraint(:slug)
  end
end
