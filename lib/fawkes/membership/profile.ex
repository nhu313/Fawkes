defmodule Fawkes.Membership.Profile do
  @moduledoc false

  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias Fawkes.Repo.Symbol, as: SymbolType

  schema "speakers" do
    field(:company, :string)
    field(:description, :string)
    field(:first, :string)
    field(:github, :string)
    field(:image, Fawkes.Uploader.Image.Type)
    field(:last, :string)
    field(:slug, SymbolType)
    field(:twitter, :string)
    field(:title, :string)

    belongs_to(:user, Fawkes.Profile.User)

    timestamps()
  end
end
