defmodule Backend.Accounts.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:user_id, :items, :total]}

  schema "orders" do
    field :order_id, :string, virtual: true
    field :items, {:array, :string}
    field :total, :float
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:id, :items, :user_id, :total])
    |> validate_required([:items, :user_id, :total])
  end
end
