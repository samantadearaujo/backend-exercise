defmodule Backend.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: true) do
      add :name, :string
      add :price, :float

      timestamps()
    end
  end
end
