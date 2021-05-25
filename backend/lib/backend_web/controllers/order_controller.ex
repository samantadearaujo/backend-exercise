defmodule BackendWeb.OrderController do
  use BackendWeb, :controller

  alias Backend.Accounts
  alias Backend.Accounts.Order

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    orders = Accounts.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Accounts.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    else
      {:error, :not_found} -> json(conn, %{error: "products_not_found"})
    end
  end

  def show(conn, %{"id" => id}) do
    order = Accounts.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Accounts.get_order!(id)

    with {:ok, %Order{} = order} <- Accounts.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Accounts.get_order!(id)

    with {:ok, %Order{}} <- Accounts.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
