defmodule AuthDemo.UserView do
  use AuthDemo.Web, :view
  
  def render("show.json", %{user: user}) do
    %{data: render_one(user, AuthDemo.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username}
  end

  def render("error.json", _) do
    %{errors: "cannot create user"}
  end
end
