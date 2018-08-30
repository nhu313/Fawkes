defmodule Fawkes.Repo.Migrations.CreateUsersTalks do
  use Ecto.Migration

  def change do
    create table(:users_talks) do
      add :user_id, references(:users, on_delete: :nothing)
      add :talk_id, references(:talks, on_delete: :nothing)

      timestamps()
    end

    create index(:users_talks, [:user_id])
    create index(:users_talks, [:talk_id])
  end
end
