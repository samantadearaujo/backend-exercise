defmodule BackendWeb.OrderView do
  use BackendWeb, :view
  alias BackendWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{order: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{order_id: order.id, items: order.items, user_id: order.user_id, total: order.total}
  end
end
