defmodule AuthDemo.Router do
  use AuthDemo.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth_api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug AuthDemo.Auth, repo: AuthDemo.Repo
  end

  scope "/auth", AuthDemo do
    pipe_through :api
    resources "/", SessionController, only: [:create, :delete]
    resources "/user", UserController, only: [:create]
  end
end
