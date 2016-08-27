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

  scope "/api", AuthDemo do
    pipe_through :auth_api
    get "/", AuthController, :index
  end

  scope "/auth", AuthDemo do
    pipe_through :api
    post "/", AuthController, :create_session
  end
end
