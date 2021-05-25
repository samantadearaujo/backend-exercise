defmodule Backend.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Accounts.User
  alias Backend.Accounts.Order
  alias Backend.Stores

  def list_users do
    Repo.all(User)
  end

  def list_orders do
    Repo.all(Order)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def get_username(user_id) do
    from(
      u in User,
      where: u.user_id == ^user_id,
      limit: 1,
      select: %User{id: u.id, user_id: u.user_id, balance: u.balance}
    )
    |> Repo.one()
  end

  def get_order!(id), do: Repo.get!(Order, id)

  def get_items_purchased(user_id) do
    from(
      u in User,
      where: u.user_id == ^user_id,
      select: u.product_ids
    )
    |> Repo.all()
    |> IO.inspect()
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def create_order(attrs \\ %{}) do
    order = get_items_purchased(attrs["user_id"])
    c = Enum.sort(order) == Enum.sort( attrs["items"])

    cond do
     true -> teste(attrs)
     c -> {:error, :products_already_purchased}
    end
  end

  defp teste(attrs) do
    order =
      attrs
      |> Map.put("total", sum_total_items(attrs["items"]))

    %Order{}
    |> Order.changeset(order)
    |> Repo.insert()
  end

  defp sum_total_items(items) do
    items
    |> Enum.map(&String.capitalize/1)
    |> Stores.get_products_by_return_sum_total()
    |> Enum.sum()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
