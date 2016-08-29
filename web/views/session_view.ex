defmodule AuthDemo.SessionView do
  use AuthDemo.Web, :view

  def render("show.json", %{session: session}) do
    %{data: render_one(session, AuthDemo.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token}
  end

  def render("error.json", %{errors: errors}) do
    %{errors: errors}
  end
end
