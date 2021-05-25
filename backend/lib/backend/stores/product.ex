defmodule Backend.Stores.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :price]}

  schema "products" do
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
    |> validate_number(:price, greater_than_or_equal_to: 0)
  end
end
