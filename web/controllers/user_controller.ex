defmodule AuthDemo.UserController do
  use AuthDemo.Web, :controller
  alias AuthDemo.User

  def create(conn, %{"username" => _, "password" =>  _} = user_params) do
    changeset = User.registration_changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
	send_resp(conn, 200, "success")
      {:error, changeset} ->
	send_resp(conn, 400, changeset)
    end
  end
  def create(conn, _) do
    send_resp(conn, 400, "Bad params")
  end
end
