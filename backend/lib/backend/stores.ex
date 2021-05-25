defmodule Backend.Stores do
  @moduledoc """
  The Stores context.
  """

  import Ecto.Query
  alias Backend.Repo

  alias Backend.Stores.Product

  def list_products do
    Repo.all(Product)
  end

  def get_product(id) do
    case Repo.get(Product, id) do
      nil -> {:error, :not_found}
      product -> {:ok, product}
    end
  end

  def get_products_by_return_sum_total(items) do
    from(
      p in Product,
      where: p.id in ^items,
      select: p.price
    )
    |> Repo.all()
  end
end
