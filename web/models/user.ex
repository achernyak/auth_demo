defmodule AuthDemo.User do
  use AuthDemo.Web, :model

  import Ecto.Query

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end


end
