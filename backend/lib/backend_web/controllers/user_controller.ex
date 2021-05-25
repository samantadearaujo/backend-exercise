defmodule BackendWeb.UserController do
  use BackendWeb, :controller

  alias Backend.Accounts
  alias Backend.Accounts.User

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Accounts.create_user(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def get_or_create_user(conn, %{"user_id" => user_id} = params) do
    user = Accounts.get_username(user_id)

    if user != nil do
      json(conn, %{user_id: user.user_id})
    else
      create(conn, %{"user_id" => user_id, "balance" => 500, "product_ids" => []})
    end
  end

  def update(
        conn,
        %{"user_id" => user_id, "balance" => balance, "product_ids" => product_ids} = user_params
      ) do
    user = Accounts.get_username(user_id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end
end
