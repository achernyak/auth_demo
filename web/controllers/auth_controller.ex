defmodule AuthDemo.AuthController do
  use AuthDemo.Web, :controller
  alias AuthDemo.User

  def create_session(conn, %{"username" => username,
                             "password" => password}) do
    case conn do
      %Plug.Conn{halted: true} = conn ->
        conn
      conn ->
        json conn, %{response: "yay"}
    end
  end
  def create_session(conn, params) do
    # IO.puts params
    conn
    |> send_resp(400, "Missing or unexpected auth params")
  end

  defp authenticate(conn) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> send_resp(401, "Invalid username/password")
      |> halt()
    end
  end
end
