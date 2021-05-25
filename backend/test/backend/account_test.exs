defmodule Backend.AccountTest do
  use Backend.DataCase

  alias Backend.Account

  describe "orders" do
    alias Backend.Account.Order

    @valid_attrs %{amount: 42, item_order: "some item_order", total: 120.5}
    @update_attrs %{amount: 43, item_order: "some updated item_order", total: 456.7}
    @invalid_attrs %{amount: nil, item_order: nil, total: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Account.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Account.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Account.create_order(@valid_attrs)
      assert order.amount == 42
      assert order.item_order == "some item_order"
      assert order.total == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Account.update_order(order, @update_attrs)
      assert order.amount == 43
      assert order.item_order == "some updated item_order"
      assert order.total == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_order(order, @invalid_attrs)
      assert order == Account.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Account.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Account.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Account.change_order(order)
    end
  end
end
