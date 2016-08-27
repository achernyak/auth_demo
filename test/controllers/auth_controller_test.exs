defmodule AuthDemo.AuthControllerTest do
  use AuthDemo.ConnCase

  test "POST /auth {} responds 400 HTTP", %{conn: conn} do
    conn = post(conn, auth_path(conn, :create_session, %{}))

    assert response(conn, 400)

#    Enum.each([
#      get(conn, video_path(conn, :new)),
#      get(conn, video_path(conn, :index)),
#      get(conn, video_path(conn, :show, "123")),
#      get(conn, video_path(conn, :edit, "123")),
#      put(conn, video_path(conn, :update, "123", %{})),
#      post(conn, video_path(conn, :create, %{})),
#      delete(conn, video_path(conn, :delete, "123")),
#    ], fn conn ->
#      assert html_response(conn, 302)
#      assert conn.halted
#    end)
  end

  test "POST /auth {username: \"joe@example.org\", password: \"abc1233\"}", %{conn: conn} do
    conn = post(conn, auth_path(conn, :create_session, %{username: "jancel", password: "abc1233"}))

    assert response(conn, 200)
  end

  test "POST /auth {username: \"joe@example.org\", password: \"abc1234\"}", %{conn: conn} do
    conn = post(conn, auth_path(conn, :create_session, %{username: "jancel", password: "abc1233"}))

    assert response(conn, 401)
  end

end
