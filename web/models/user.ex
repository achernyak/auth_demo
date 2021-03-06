defmodule AuthDemo.User do
  use AuthDemo.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  def changeset(model, params \\ :emtpy) do
    model
    |> cast(params, ~w(username), [])
    |> validate_length(:username, min: 1, max: 255)
  end

  def registration_changeset(model, params \\ :empty) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
	put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
	changeset
    end
  end
end
