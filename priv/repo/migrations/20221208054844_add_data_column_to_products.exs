defmodule Hello.Repo.Migrations.AddDataColumnToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :data, :map, default: %{}, null: false
    end
  end
end
