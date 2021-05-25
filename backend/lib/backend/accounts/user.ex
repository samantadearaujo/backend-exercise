defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:user_id, :balance, :product_ids]}

  schema "users" do
    field :user_id, :string
    field :balance, :integer
    field :product_ids, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_id, :balance, :product_ids])
    |> validate_required([:user_id])
    |> unique_constraint(:user_id)
    |> validate_number(:balance, greater_than_or_equal_to: 0)
  end
end
