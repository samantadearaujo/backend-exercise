defmodule Backend.StoresTest do
  use Backend.DataCase

  alias Backend.Stores

  describe "products" do
    alias Backend.Stores.Product

    test "list_products/0 returns empty" do
      assert Stores.list_products() == []
    end

    test "list_products/0 returns all" do
      product =
        Backend.Repo.insert!(%Backend.Stores.Product{
          name: "TestABS",
          price: 00.99
        })

      result = Stores.list_products()
      assert result = product
    end
  end
end
