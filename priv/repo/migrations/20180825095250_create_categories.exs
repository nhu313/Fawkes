defmodule Fawkes.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :slug, :string
      add :name, :string
      add :icon_url, :string

      timestamps()
    end

    create unique_index(:categories, [:slug])
    create index("categories", :name, unique: true)
  end
end
