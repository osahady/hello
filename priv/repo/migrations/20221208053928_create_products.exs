defmodule Hello.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :archived_at, :naive_datetime
      add :name, :string

      timestamps()
    end
  end
end
