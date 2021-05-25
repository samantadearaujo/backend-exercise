defmodule BackendWeb.UserView do
  use BackendWeb, :view
  alias BackendWeb.UserView
  alias BackendWeb.ProductView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, UserView, "user_all.json")}
  end

  def render("user.json", %{user: user}) do
    %{user_id: user.user_id, balance: user.balance, product_ids: user.product_ids}
  end

  def render("user_all.json", %{user: user}) do
    %{data: %{balance: user.balance}, product_ids: user.product_ids, user_id: user.user_id}
  end
end
