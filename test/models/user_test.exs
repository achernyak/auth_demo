defmodule AuthDemo.UserTest do
  use AuthDemo.ModelCase

  alias AuthDemo.User

  @valid_attrs %{username: "test", password: "password0"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset, username too short" do
    changeset = User.changeset(
      %User{}, Map.put(@valid_attrs, :username, "")
    )
    refute changeset.valid?
  end

  test "registration_changeset, valid attributes" do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    assert changeset.changes.password_hash
    assert changeset.valid?
  end

  test "registration_changeset, password too short" do
    changeset = User.registration_changeset(
      %User{}, Map.put(@valid_attrs, :password, "12345")
    )
    refute changeset.valid?
  end
end
