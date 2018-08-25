defmodule Fawkes.Repo.Migrations.CreateScheduleSlots do
  use Ecto.Migration

  def change do
    create table(:schedule_slots) do
      add :slug, :string
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime

      timestamps()
    end

    create unique_index(:schedule_slots, [:slug])
  end
end
