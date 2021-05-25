defmodule Backend.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: true) do
      add :user_id, :string
      add :items, {:array, :string}
      add :total, :float

      timestamps()
    end
  end
end
