defmodule BackendWeb.ProductControllerTest do
  use BackendWeb.ConnCase

  alias Backend.Stores
  alias Backend.Stores.Product

  alias Backend.Repo

  setup %{conn: conn} do
    product =
      Repo.insert!(%Product{
        name: "TestABS",
        price: 00.99
      })

    {:ok, conn: put_req_header(conn, "accept", "application/json"), product: product}
  end

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert json_response(conn, 200)["data"] != []
    end
  end
end
