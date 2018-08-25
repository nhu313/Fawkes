defmodule Fawkes.Repo.Migrations.CreateTalks do
  use Ecto.Migration

  def change do
    create table(:talks) do
      add :slug, :string
      add :title, :string
      add :description, :text
      add :slot_id, references(:schedule_slots, on_delete: :nothing)
      add :audience_id, references(:audiences, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:talks, [:slug])
    create index(:talks, [:slot_id])
    create index(:talks, [:audience_id])
    create index(:talks, [:location_id])
  end
end
