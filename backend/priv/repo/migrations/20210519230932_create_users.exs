defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: true) do
      add :user_id, :string
      add :balance, :integer
      add :product_ids, {:array, :string}

      timestamps()
    end
  end
end
