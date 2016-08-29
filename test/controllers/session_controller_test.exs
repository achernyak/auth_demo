defmodule AuthDemo.SessionControllerTest do
  use AuthDemo.ConnCase

  alias AuthDemo.Session
  alias AuthDemo.User
  @valid_attrs %{username: "test", password: "password0"}

  setup %{conn: conn} do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    Repo.insert changeset
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), @valid_attrs
    assert token = json_response(conn, 201)["token"]
    assert Repo.get_by(Session, token: token)
  end

  test "does not create resource and renders errors when password is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), Map.put(@valid_attrs, :password, "notright")
    assert json_response(conn, 401)["errors"] != %{}
  end

  test "does not create a resource and renders errors when email is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), Map.put(@valid_attrs, :username, "notfound")
    assert json_response(conn, 401)["errors"] != %{}
  end
end
