defmodule AuthDemo.SessionController do
  use AuthDemo.Web, :controller

  def create(conn, %{"username" => user,
		     "password" => pass}) do
    case AuthDemo.Auth.login_by_username_and_pass(conn, user, pass, repo:
	  Repo) do
      {:ok, session} ->
	conn
	|> put_status(:created)
	|> json(%{token: session.token})
      {:errors, reason, conn} ->
	conn
	|> put_status(:unauthorized)
	|> json(%{errors: reason})
    end
  end

  def delete(conn, _) do
    conn
    |> AuthDemo.Auth.logout()

    send_resp(conn, 200, "deleted")
  end
end
