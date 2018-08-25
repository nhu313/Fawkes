defmodule Fawkes.Schedule do
  alias Fawkes.Repo
  alias Fawkes.Schedule.Category

  def all_category do
    Repo.all(Category)
  end

  def category_changeset(changeset \\ %Category{}) do
    Category.changeset(changeset, %{})
  end

  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end
end
